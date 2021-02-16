# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      class GetDeployedVersion < Dry::CLI::Command
        desc 'Get the deployed version of OBS'
        option :url, type: :string, default: 'https://api.opensuse.org', desc: 'API url'
        option :ignore_certificate, aliases: ['k'], type: :bool, default: false, desc: 'Ignore invalid or self-signed SSL certificates'

        def call(url:, ignore_certificate:, **)
          if ignore_certificate
            OpenSSL::SSL.send(:remove_const, :VERIFY_PEER)
            OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
          end

          puts "Deployed version: #{ObsDeploy::CheckDiff.new(server: url).obs_running_commit}"
        end
      end
    end
  end
end

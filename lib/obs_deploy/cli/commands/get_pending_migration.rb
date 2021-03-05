# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      class GetPendingMigration < Dry::CLI::Command
        option :url, type: :string, default: 'https://api.opensuse.org', desc: 'API url'
        option :ignore_certificate, aliases: ['k'], type: :bool, default: false, desc: 'Ignore invalid or self-signed SSL certificates'

        def call(url:, ignore_certificate:, **)
          if ignore_certificate
            OpenSSL::SSL.send(:remove_const, :VERIFY_PEER)
            OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
          end

          migrations = ObsDeploy::CheckDiff.new(server: url).migrations
          if migrations.empty?
            puts 'No pending migrations'
            exit(0)
          else
            puts migrations
            exit(1)
          end
        end
      end
    end
  end
end

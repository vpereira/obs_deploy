# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      class GetDeployedVersion < Dry::CLI::Command
        desc 'Get the deployed version of OBS'
        option :host, type: :string, default: 'https://api.opensuse.org', desc: 'API server'

        def call(host:, **)
          puts "Deployed version: #{ObsDeploy::CheckDiff.new(server: host).obs_running_commit}"
        end
      end
    end
  end
end

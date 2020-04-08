# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      class GetDeployedVersion < Dry::CLI::Command
        desc 'Get the deployed version of OBS'
        option :url, type: :string, default: 'https://api.opensuse.org', desc: 'API url'

        def call(url:, **)
          puts "Deployed version: #{ObsDeploy::CheckDiff.new(server: url).obs_running_commit}"
        end
      end
    end
  end
end

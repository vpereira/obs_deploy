# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      class GetPendingMigration < Dry::CLI::Command
        option :url, type: :string, default: 'https://api.opensuse.org', desc: 'API url'

        def call(url:, **)
          migrations = ObsDeploy::CheckDiff.new(server: url).migrations
          if migrations.empty?
            puts 'No pending migrations'
          else
            puts migrations
          end
        end
      end
    end
  end
end

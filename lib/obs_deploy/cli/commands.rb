# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      extend Dry::CLI::Registry
      autoload :Version, './lib/obs_deploy/cli/commands/version.rb'
      autoload :RefreshRepositories, './lib/obs_deploy/cli/commands/refresh_repositories.rb'
      autoload :Deploy, './lib/obs_deploy/cli/commands/deploy.rb'
    end
  end
end

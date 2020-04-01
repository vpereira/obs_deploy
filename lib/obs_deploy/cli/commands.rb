# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      extend Dry::CLI::Registry
      autoload :Version, './lib/obs_deploy/cli/commands/version.rb'
      autoload :RefreshRepositories, './lib/obs_deploy/cli/commands/refresh_repositories.rb'
      autoload :Deploy, './lib/obs_deploy/cli/commands/deploy.rb'
      autoload :GetPackageVersion, './lib/obs_deploy/cli/commands/get_package_version.rb'
      autoload :GetDeployedVersion, './lib/obs_deploy/cli/commands/get_deployed_version.rb'

      # register the commands and its command line
      register 'available-package', GetPackageVersion
      register 'deployed-version', GetDeployedVersion
      register 'version', Version, aliases: ['v', '-v', '--version']
      register 'deploy', Deploy
      register 'refresh-repositories', RefreshRepositories
    end
  end
end

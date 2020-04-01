# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      extend Dry::CLI::Registry
      autoload :Version, File.join(__dir__, 'commands/version.rb')
      autoload :RefreshRepositories, File.join(__dir__, 'commands/refresh_repositories.rb')
      autoload :Deploy, File.join(__dir__, 'commands/deploy.rb')
      autoload :GetPackageVersion,  File.join(__dir__, 'commands/get_package_version.rb')
      autoload :GetDeployedVersion, File.join(__dir__, 'commands/get_deployed_version.rb')

      # register the commands and its command line
      register 'available-package', GetPackageVersion
      register 'deployed-version', GetDeployedVersion
      register 'version', Version, aliases: ['v', '-v', '--version']
      register 'deploy', Deploy
      register 'refresh-repositories', RefreshRepositories
    end
  end
end

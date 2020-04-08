# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      class GetPackageVersion < Dry::CLI::Command
        desc 'Get the available package version'
        option :url, type: :string, default: 'https://api.opensuse.org', desc: 'API url'
        option :package, type: :string, default: 'obs-api', desc: 'Package name'
        option :product, type: :string, default: 'SLE_12_SP4', desc: 'Product name'
        option :architecture, type: :string, default: 'x86_64', desc: 'Architecture'

        def call(url:, product:, **)
          puts "Available package: #{ObsDeploy::CheckDiff.new(server: url, product: product).package_version}"
        end
      end
    end
  end
end

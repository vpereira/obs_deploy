# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      class GetPackageVersion < Dry::CLI::Command
        desc 'Get the available package version'
        option :host, type: :string, default: 'https://api.opensuse.org', desc: 'API server'
        option :package, type: :string, default: 'obs-api', desc: 'Package name'
        option :product, type: :string, default: 'SLE_12_SP4', desc: 'Product name'
        option :architecture, type: :string, default: 'x86_64', desc: 'Architecture'

        def call(host:, product:, **)
          puts "Available package: #{ObsDeploy::CheckDiff.new(server: host, product: product).package_version}"
        end
      end
    end
  end
end

# frozen_string_literal: true

module ObsDeploy
  module CLI
    module Commands
      class GetDiff < Dry::CLI::Command
        desc 'Get diff between deployed package and available package'
        option :url, type: :string, default: 'https://api.opensuse.org', desc: 'API url'
        option :package, type: :string, default: 'obs-api', desc: 'Package name'
        option :project, type: :string, default: 'OBS:Server:Unstable', desc: 'Project name'
        option :product, type: :string, default: 'SLE_12_SP4', desc: 'Product name'
        option :architecture, type: :string, default: 'x86_64', desc: 'Architecture'

        def call(url:, product:, project:, **)
          puts "diff : #{ObsDeploy::CheckDiff.new(server: url, project: project, product: product).github_diff}"
        end
      end
    end
  end
end

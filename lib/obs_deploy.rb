# frozen_string_literal: true

require 'obs_deploy/version'
require 'open-uri'
require 'net/http'
require 'nokogiri'

module ObsDeploy
  class Error < StandardError; end

  class CheckDiff
    def initialize(server: 'https://api.opensuse.org', product: 'SLE_12_SP4')
      @server = server
      @product = product
    end

    def package_version
      doc = Nokogiri::XML(open(package_url))
      doc.xpath("//binary[starts-with(@filename, 'obs-api')]/@filename").to_s
    end

    def package_commit
      package_version.match(/obs-api-.*\..*\..*\.(.*)-.*\.rpm/).captures.first
    end

    def obs_running_commit
      doc = Nokogiri::XML(about_url)
      doc.xpath('//commit/text()').to_s
    end

    def github_diff
      Net::HTTP.get(URI("https://github.com/openSUSE/open-build-service/compare/#{obs_running_commit}...#{package_commit}.diff"))
    end

    def has_migration?
      !!github_diff.match(%r{db/migrate})
    end

    def package_url
      URI("#{@server}/public/build/OBS:Server:Unstable/#{@product}/x86_64/obs-server")
    end

    def about_url
      URI("#{@server}/about")
    end
  end
  class Systemctl
    class << self
      def status
        system('systemctl status obs-api-support.target')
      end

      def list_dependencies
        system('systemctl list-dependencies obs-api-support.target')
      end
    end
  end

  class Zypper
    def update(dry_run: true)
      if dry_run
        run ['zypper'] + update_params + dry_run_params + package_name
      else
        run ['zypper'] + update_params + package_name
      end
    end

    def refresh
      run ['zypper', '--non-interactive', '--gpg-auto-import-keys', 'refresh']
    end

    private

    def run(params)
      # ...
    end

    def package_name
      ['obs-api']
    end

    def update_params
      ['--non-interactive', 'update', '--best-effort', '--details']
    end

    def dry_run_params
      ['--dry-run --download-only']
    end
  end
end

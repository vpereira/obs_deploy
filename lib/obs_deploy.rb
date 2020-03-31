# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'cheetah'
require 'nokogiri'
require 'obs_deploy/version'
require 'obs_deploy/check_diff'
require 'obs_deploy/ssh'

module ObsDeploy
  class Error < StandardError; end
  class Systemctl
    class << self
      def status
        'systemctl status obs-api-support.target'
      end

      def list_dependencies
        'systemctl list-dependencies obs-api-support.target'
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
      params
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

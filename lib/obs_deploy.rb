# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'cheetah'
require 'nokogiri'
require 'obs_deploy/version'
require 'obs_deploy/check_diff'

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

  class SSH
    attr_reader :user, :server, :port, :identity_file

    def initialize(opts = {})
      @user = opts[:user] || 'root'
      @server = opts[:server] || 'localhost'
      @port = opts[:port] || 22
      @identity_file = opts[:identity_file] 
    end

    def build_command
      command_line = ['-tt', "#{@user}@#{@server}", "-p", @port.to_s]
      command_line << ["-i", @identity_file] if @identity_file
      ["ssh"] + command_line.flatten
    end

    def run(cmd)
      results, errors = Cheetah.run(build_command + cmd, stdout: :capture, stderr: :capture)
      puts results
      puts errors
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

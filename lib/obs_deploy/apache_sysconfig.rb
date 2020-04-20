# frozen_string_literal: true

module ObsDeploy
  class ApacheSysconfig
    attr_reader :apache_sysconfig

    def initialize
      @apache_sysconfig = '/etc/sysconfig/apache2'
    end

    def enable_maintenance_mode
      write_apache_sysconfig('APACHE_SERVER_FLAGS="STATUS MAINTENANCE"')
    end

    def disable_maintenance_mode
      write_apache_sysconfig('APACHE_SERVER_FLAGS="STATUS"')
    end

    def maintenance_mode?
      File.open(apache_sysconfig).read.include?('MAINTENANCE')
    end

    private

    def write_apache_sysconfig(line)
      File.open(apache_sysconfig, 'w') do |file|
        file.write(line)
      end
    end
  end
end

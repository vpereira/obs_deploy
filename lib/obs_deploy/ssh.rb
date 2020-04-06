# frozen_string_literal: true

module ObsDeploy
  class SSH
    attr_reader :user, :server, :port, :identity_file

    def initialize(opts = {})
      @user = opts[:user] || 'root'
      @server = opts[:server] || 'localhost'
      @port = opts[:port] || 22
      @identity_file = opts[:identity_file]
      @debug = opts[:debug] || false
    end

    def build_command
      command_line = ['-tt', "#{@user}@#{@server}", '-p', @port.to_s]
      command_line << ['-i', @identity_file] if @identity_file
      ['ssh'] + command_line.flatten
    end

    def run(cmd)
      Cheetah.run(build_command + cmd, logger: logger)
    end

    def logger
      Logger.new(STDOUT, level: logger_level)
    end

    def logger_level
      @debug ? Logger::DEBUG : Logger::INFO
    end
  end
end

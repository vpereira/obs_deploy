# frozen_string_literal: true

module ObsDeploy
  class Systemctl
    def status
      run ['systemctl'] + ['status'] + target
    end

    def list_dependencies
      run ['systemctl'] + ['list-dependencies'] + target
    end

    def restart_apache
      run ['systemctl'] + ['restart'] + ['apache2']
    end

    def status_apache
      run ['systemctl'] + ['status'] + ['apache2']
    end

    private

    def target
      ['obs-api-support.target']
    end

    def run(params)
      params + ['--no-pager']
    end
  end
end

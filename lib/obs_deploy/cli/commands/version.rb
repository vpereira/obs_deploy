module ObsDeploy
    module CLI
        module Commands
            class Version < Dry::CLI::Command
                desc 'Print version'
                def call(*)
                    puts ObsDeploy::VERSION
                end
            end
        end
    end
end
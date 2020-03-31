# frozen_string_literal: true

RSpec.describe ObsDeploy::SSH do
    describe '.new' do
        context 'default parameters' do
            subject { described_class.new }

            it { expect(subject.port).to eq(22) }
            it { expect(subject.user).to eq('root') }
            it { expect(subject.server).to eq('localhost') }
            it { expect(subject.build_command).to eq(["ssh", "-tt", "root@localhost", "-p", "22"])}
        end
    end
end
 
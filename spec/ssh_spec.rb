# frozen_string_literal: true

RSpec.describe ObsDeploy::SSH do
    describe '.new' do
        context 'default parameters' do
            subject { described_class.new }

            it { expect(subject.port).to eq(22) }
        end
    end
end
 
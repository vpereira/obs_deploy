# frozen_string_literal: true

RSpec.describe ObsDeploy::Zypper do
  subject { described_class.new }
  describe '.new' do
    context 'default parameters' do
      it { expect(subject.dry_run).to be_truthy }
    end
  end

  describe 'addlock' do
    it { expect(subject.add_lock).to eq(%w[zypper addlock obs-api]) }
  end

  describe '#update' do
    context 'dry_run true' do
      it {
        expect(subject.update).to eq(['zypper', '--non-interactive', 'update',
                                      '--best-effort', '--details', '--dry-run', '--download-only',
                                      'obs-api'])
      }
    end
    context 'dry_run false' do
      subject { described_class.new(dry_run: false) }
      it {
        expect(subject.update).to eq(['zypper', '--non-interactive', 'update',
                                      '--best-effort', '--details', 'obs-api'])
      }
    end
  end
end

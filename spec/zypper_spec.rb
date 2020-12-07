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

  describe '#locked?' do
    context "when the package is locked" do
      before do
        allow(Cheetah.run).to receive(['zypper', 'locks', 'obs-api'], stdout: :capture)
          .and_return("
              | Name     | Type    | Repository
            --+----------+---------+-----------
            1 | obs-api  | package | (any)
            2 | xz-devel | package | (any)
          ")
      end

      it { expect(subject.locked?).to be true }
    end

    context "when the package is not locked" do
      before do
        allow(Cheetah.run).to receive(['zypper', 'locks', 'obs-api'], stdout: :capture)
          .and_return("
              | Name     | Type    | Repository
            --+----------+---------+-----------
            1 | xz       | package | (any)
            2 | xz-devel | package | (any)
          ")
      end

      it { expect(subject.locked?).to be false }
    end
  end
end

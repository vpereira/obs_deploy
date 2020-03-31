# frozen_string_literal: true

RSpec.describe ObsDeploy::CheckDiff do
  let(:check_diff) { described_class.new }

  it { expect(check_diff).not_to be_nil }

  describe '#package_version' do
    subject { check_diff.package_version }
    it { expect(subject).not_to be_nil }
  end

  describe '#package_commit' do
    subject { check_diff.package_commit }
    it { expect(subject).not_to be_nil }
  end
end

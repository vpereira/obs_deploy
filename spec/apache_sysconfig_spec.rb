# frozen_string_literal: true

require 'tempfile'

RSpec.describe ObsDeploy::ApacheSysconfig do
  let!(:apache_sysconfig) { described_class.new }

  let(:apache_sysconfig_file) { Tempfile.new }

  before do
    allow(apache_sysconfig).to receive(:apache_sysconfig).and_return(apache_sysconfig_file.path)
  end

  after do
    apache_sysconfig_file.unlink
  end

  describe '#apache_sysconfig' do
    it { expect(apache_sysconfig.apache_sysconfig).to eq(apache_sysconfig_file.path) }
  end

  describe '#enable_maintenance_mode' do
    it { expect { apache_sysconfig.enable_maintenance_mode }.not_to raise_error }
  end

  describe '#disable_maintenance_mode' do
    it { expect { apache_sysconfig.disable_maintenance_mode }.not_to raise_error }
  end

  describe '#maintenance_mode?' do
    context 'maintenance mode on' do
      before do
        apache_sysconfig.enable_maintenance_mode
      end
      it { expect(apache_sysconfig.maintenance_mode?).to be_truthy }
    end
    context 'maintenance mode off' do
      before do
        apache_sysconfig.disable_maintenance_mode
      end
      it { expect(apache_sysconfig.maintenance_mode?).to be_falsey }
    end
  end
end

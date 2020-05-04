# frozen_string_literal: true

require 'pry'
require 'tempfile'

RSpec.describe ObsDeploy::ApacheSysconfig do
  let!(:apache_sysconfig) { described_class.new }

  let(:sysconfig_fixture) { File.read(File.join(__dir__, 'fixtures', 'apache_sysconfig.txt')) }

  let(:apache_sysconfig_file) { Tempfile.new }

  before do
    # add content to apache_sysconfig_file
    apache_sysconfig_file.write(sysconfig_fixture)
    apache_sysconfig_file.flush
    allow(apache_sysconfig).to receive(:path).and_return(apache_sysconfig_file.path)
  end

  after do
    apache_sysconfig_file.unlink
  end

  describe '#apache_sysconfig' do
    it { expect(apache_sysconfig.path).to eq(apache_sysconfig_file.path) }
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

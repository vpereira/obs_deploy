# frozen_string_literal: true

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', '..', '..', 'lib')

require 'obs_deploy'
require 'dry/cli'
require 'obs_deploy/cli/commands'

RSpec.describe ObsDeploy::CLI::Commands::GetDiff do
  let(:get_diff) { described_class.new }

  it { expect(get_diff.options.size).to eq(6) }

  describe 'option ignore_certificate' do
    let(:ignore_certificate_option) { get_diff.options.select { |o| o.name == :ignore_certificate }.first }
    it { expect(ignore_certificate_option).not_to be_nil }
    it { expect(ignore_certificate_option).to respond_to(:options) }
    it { expect(ignore_certificate_option.options[:aliases]).to include('k') }
  end
end

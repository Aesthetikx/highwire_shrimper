describe HighwireShrimper::IRC::Commands::Join do
  subject(:command) { described_class.new channels:, keys: }

  let(:channels) { %w[#channel_one #channel_two] }

  let(:keys) { %w[key_one key_two] }

  describe '#to_s' do
    subject { command.to_s }

    it { is_expected.to eq 'JOIN #channel_one,#channel_two key_one,key_two' }

    context 'with no keys' do
      let(:keys) { %w[] }

      it { is_expected.to eq 'JOIN #channel_one,#channel_two' }
    end

    context 'with only one key' do
      let(:keys) { %w[key_one] }

      it { is_expected.to eq 'JOIN #channel_one,#channel_two key_one' }
    end

    context 'when leave_all is true' do
      let(:command) { described_class.new leave_all: true }

      it { is_expected.to eq 'JOIN 0' }
    end
  end
end

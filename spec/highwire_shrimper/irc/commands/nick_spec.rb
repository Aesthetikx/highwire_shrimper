describe HighwireShrimper::IRC::Commands::Nick do
  subject(:command) { described_class.new nickname: }

  let(:nickname) { 'flamel' }

  describe '#to_s' do
    subject { command.to_s }

    it { is_expected.to eq 'NICK flamel' }
  end
end

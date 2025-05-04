describe HighwireShrimper::IRC::Commands::User do
  subject(:command) { described_class.new user:, realname: }

  let(:user) { 'flamel' }

  let(:realname) { 'Nicolas Flamel' }

  describe '#to_s' do
    subject { command.to_s }

    it { is_expected.to eq 'USER flamel 0 * :Nicolas Flamel' }
  end
end

describe HighwireShrimper::IRC::Commands::Ping do
  subject(:command) { described_class.new server1:, server2: }

  # rubocop:disable RSpec/IndexedLet
  let(:server1) { 'server.one' }

  let(:server2) { 'server.two' }
  # rubocop:enable RSpec/IndexedLet

  describe '#to_s' do
    subject { command.to_s }

    context 'with two servers' do
      it { is_expected.to eq 'PING server.one server.two' }
    end

    context 'with one server' do
      let(:server2) { nil }

      it { is_expected.to eq 'PING :server.one' }
    end
  end
end

describe HighwireShrimper::IRC::Parser do
  describe '#evaluate' do
    {
      'JOIN #ruby' => {
        command: 'JOIN',
        params: %w[#ruby]
      },
      ':irc.example.com CAP LS * :multi-prefix extended-join sasl' => {
        server: 'irc.example.com',
        command: 'CAP',
        params: %w[LS *],
        trailing: 'multi-prefix extended-join sasl'
      },
      # TODO: IRCv3 Tags
      # @id=234AB :dan!d@localhost PRIVMSG #chan :Hey what's up!
      ':dan!d@localhost PRIVMSG #chan :Hey what’s up!' => {
        nickname: 'dan',
        user: 'd',
        host: 'localhost',
        command: 'PRIVMSG',
        params: %w[#chan],
        trailing: 'Hey what’s up!'
      },
      'CAP REQ :sasl' => {
        command: 'CAP',
        params: %w[REQ],
        trailing: 'sasl'
      }
    }.each do |message, expected|
      it "parses #{message}" do
        message += "\r\n"

        result = described_class.new.evaluate message

        expect(result).to eq expected
      end
    end
  end
end

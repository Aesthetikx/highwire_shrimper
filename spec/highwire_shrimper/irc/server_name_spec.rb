RSpec.describe HighwireShrimper::IRC::ServerName do
  describe '#valid?' do
    [
      'irc.example.com',        # Standard dot-separated name
      'us.undernet.org',        # Common IRC net format
      'irc1.efnet.net',         # Contains digit in label
      'host123.server99.com',   # Digits in any position are OK
      'a.b.c.d.e.f.g.com',      # Many levels, still valid
      'xn--n3h.com',            # Punycode for international domain support
      'irc-server.local',       # Hyphen in label is OK
      "#{'a' * 63}.example.com" # Label is 63 characters
    ].each do |good_example|
      it "considers '#{good_example}' to be valid" do
        expect do
          described_class.new good_example
        end.not_to raise_error
      end
    end

    [
      'irc..example.com',       # Empty label
      '-irc.example.com',       # Label starts with a hyphen
      'irc-.example.com',       # Label ends with a hyphen
      '.irc.example.com',       # Label starts with a dot
      'irc.example.com.',       # Name ends in dot
      'irc_example.com',        # Underscore not allowed in hostnames
      'irc.example!.com',       # Exclamation mark is not allowed
      '123',                    # Technically could be a hostname, but IRC expects dot-separated
      'a..b.com',               # Empty label between dots
      'irc.exa mple.com',       # Space in label
      'irc.example,com',        # Comma not allowed
      'irc..',                  # Ends in dot and has empty label
      "#{'a' * 64}.example.com" # Label exceeds 63 characters
    ].each do |bad_example|
      it "does not consider '#{bad_example}' to be valid" do
        expect do
          described_class.new bad_example
        end.to raise_error(HighwireShrimper::IRC::ServerName::InvalidServerNameError)
      end
    end
  end
end

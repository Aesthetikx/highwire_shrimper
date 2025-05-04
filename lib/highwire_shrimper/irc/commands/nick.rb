module HighwireShrimper
  module IRC
    module Commands
      # https://datatracker.ietf.org/doc/html/rfc2812#section-3.1.2
      class Nick
        attr_reader :nickname

        def initialize(nickname:)
          @nickname = nickname
        end

        def to_s
          "NICK #{nickname}"
        end
      end
    end
  end
end

module HighwireShrimper
  module IRC
    module Commands
      # https://datatracker.ietf.org/doc/html/rfc2812#section-3.7.3
      class Pong
        attr_reader :server1, :server2

        def initialize(server1:, server2: nil)
          @server1 = ServerName server1
          @server2 = ServerName server2
        end

        def to_s
          if server2
            "PONG #{server1} #{server2}"
          else
            "PONG :#{server1}"
          end
        end
      end
    end
  end
end

module HighwireShrimper
  module IRC
    module Commands
      # https://datatracker.ietf.org/doc/html/rfc1459#section-4.6.2
      class Ping
        attr_reader :server1, :server2

        def initialize(server1:, server2: nil)
          @server1 = ServerName server1
          @server2 = ServerName server2 if server2
        end

        def to_s
          if server2
            "PING #{server1} #{server2}"
          else
            "PING :#{server1}"
          end
        end
      end
    end
  end
end

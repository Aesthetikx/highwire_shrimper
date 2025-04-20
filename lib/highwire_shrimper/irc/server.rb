module HighwireShrimper
  module IRC
    # A named IRC server with a given hostname and port.
    class Server
      attr_reader :name, :hostname, :port

      def initialize(name:, hostname:, port:)
        @name = name
        @hostname = hostname
        @port = port
      end
    end
  end
end

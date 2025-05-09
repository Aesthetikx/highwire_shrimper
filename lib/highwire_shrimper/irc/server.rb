module HighwireShrimper
  module IRC
    # A named IRC server with a given hostname and port.
    class Server
      attr_reader :name, :hostname, :port

      def initialize(name:, hostname:, port:, ssl:)
        @name = name
        @hostname = ServerName(hostname)
        @port = port
        @ssl = ssl
      end

      def ssl? = @ssl
    end
  end
end

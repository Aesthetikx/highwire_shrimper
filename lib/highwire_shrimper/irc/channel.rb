module HighwireShrimper
  module IRC
    # An IRC channel on a particular server.
    class Channel
      attr_reader :server, :name

      def initialize(server:, name:)
        @server = server
        @name = name
      end
    end
  end
end

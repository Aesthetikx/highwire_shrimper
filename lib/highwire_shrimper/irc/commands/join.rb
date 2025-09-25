module HighwireShrimper
  module IRC
    module Commands
      # https://datatracker.ietf.org/doc/html/rfc2812#section-3.2.1
      class Join
        attr_reader :channels, :keys

        def initialize(channels: [], keys: [], leave_all: false)
          @channels = Array(channels)
          @keys = Array(keys)
          @keys = @keys.map { |value| Key value }
          @leave_all = leave_all
        end

        def leave_all? = @leave_all

        def to_s
          if leave_all?
            'JOIN 0'
          else
            [
              'JOIN',
              channels.join(','),
              keys.join(',')
            ].reject(&:empty?).compact.join(' ')
          end
        end
      end
    end
  end
end

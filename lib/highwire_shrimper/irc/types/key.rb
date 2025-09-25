module HighwireShrimper
  module IRC
    module Types
      # An RFC-2812 conforming <key> suitable for IRC.
      class Key
        # See: https://datatracker.ietf.org/doc/html/rfc2812#section-2.3.1
        RFC_2812_KEY_REGEX = /\A[\x01-\x05\x07-\x08\x0C\x0E-\x1F\x21-\x7F]{1,23}\z/

        attr_reader :value

        def initialize(value)
          @value = value

          fail InvalidFormatError, "'#{value}' is not a valid RFC-2812 <key>" unless valid?
        end

        alias to_s value

        private

        def valid? = value.match? RFC_2812_KEY_REGEX

        module KernelMethods # rubocop:disable Style/Documentation
          def Key(value) # rubocop:disable Naming/MethodName
            case value
            when Key
              value
            else
              Key.new value.to_s
            end
          end
        end
      end
    end
  end
end

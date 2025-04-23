module HighwireShrimper
  module IRC
    # A class that represents and validates a RFC 1123 compatible server name suitable for IRC.
    class ServerName
      class InvalidServerNameError < Error; end

      RFC_1123_REGEX = /
        \A
        (?=.{1,255}\z)                  # The entire length must be between 1 and 255 characters
        (?:                             # A non-capturing group for repeated labels
          [a-z0-9]                      # A label must start with alphanum
          (?:[a-z0-9\-]{0,61}[a-z0-9])? # The middle and end of label (optional for 1-character labels)
          \.                            # A label ends with a period
        )+                              # There must be at least one label before the TLD
        [a-z]{2,63}                     # The TLD must be letters only between 2–63 characters
        \z
      /ix # Case insensitive, extended mode

      attr_reader :name

      def initialize(name)
        @name = name.chomp.strip

        fail InvalidServerNameError, "'#{name}' is not a valid RFC 1123 server name" unless valid?
      end

      alias to_s name

      private

      def valid?
        name.match?(RFC_1123_REGEX)
      end
    end
  end
end

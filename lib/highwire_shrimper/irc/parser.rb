require 'ebnf'

# rubocop:disable Naming/VariableNumber, Style/SymbolProc

module HighwireShrimper
  module IRC
    # An implementation of a ENBF::PEG::Parser for RFC 2812
    class Parser
      GRAMMAR_PATH = File.join __dir__, 'parser', 'rfc2812.abnf'

      include EBNF::PEG::Parser

      def initialize
        grammar = File.read GRAMMAR_PATH

        abnf = EBNF.parse grammar, format: :abnf

        @rules = abnf.make_peg.ast
      end

      def evaluate(input)
        logger = Logger.new $stdout
        logger.level = :fatal

        options = { whitespace: '', logger: }

        parse input, :message, @rules, **options
      end

      deep_values = lambda do |object|
        case object
        when Array
          object.flat_map(&deep_values)
        when Hash
          deep_values[object.values]
        else
          object
        end
      end

      production :message do |value|
        value = value.reduce :merge

        {
          prefix: value[:_message_1],
          command: value[:command],
          **value[:_message_2]
        }
      end

      production :_message_3 do |value|
        value.reduce(:merge)[:prefix]
      end

      production :prefix do |value|
        value = value.reduce :merge

        {
          nickname: value[:nickname],
          **value[:_prefix_3]
        }
      end

      production :_prefix_3 do |value|
        value = value.reduce :merge

        {
          user: value[:_prefix_5],
          host: value[:host]
        }
      end

      production :_prefix_5 do |value|
        deep_values[value].last
      end

      production :nickname do |value|
        deep_values[value].join
      end

      production :user do |value|
        value.join
      end

      production :host do |value|
        deep_values[value].join
      end

      production :shortname do |value|
        deep_values[value].join
      end

      production :command do |value|
        value.join
      end

      production :_message_2 do |value|
        value = value.reduce :merge

        {
          params: value[:_params_3],
          trailing: value[:_params_4]
        }
      end

      production :middle do |value|
        deep_values[value].join
      end

      production :_params_3 do |value|
        value.flatten.filter_map { |v| v[:middle] }
      end

      production :_params_4 do |value|
        case value
        in [*, { trailing: }]
          trailing
        else
          nil
        end
      end

      production :trailing do |value|
        value.join
      end
    end
  end
end

# rubocop:enable Naming/VariableNumber, Style/SymbolProc

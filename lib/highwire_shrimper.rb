require_relative 'highwire_shrimper/tui'
require_relative 'highwire_shrimper/version'

# HighwireShrimper is an IRC client and library.
module HighwireShrimper
  class Error < StandardError; end

  def self.shrimp!
    TUI.open!
  end
end

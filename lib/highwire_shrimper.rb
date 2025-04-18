require 'zeitwerk'

Zeitwerk::Loader.for_gem.tap do |loader|
  inflections = { 'tui' => 'TUI' }

  loader.inflector.inflect inflections

  loader.setup
end

# HighwireShrimper is an IRC client and library.
module HighwireShrimper
  class Error < StandardError; end

  def self.shrimp!
    TUI.open!
  end
end

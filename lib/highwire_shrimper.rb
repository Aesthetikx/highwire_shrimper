require 'zeitwerk'

Zeitwerk::Loader.for_gem.tap do |loader|
  inflections = { 'irc' => 'IRC', 'tui' => 'TUI' }

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

Kernel.include HighwireShrimper::IRC::Types::Key::KernelMethods
Kernel.include HighwireShrimper::IRC::Types::ServerName::KernelMethods

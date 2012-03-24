IRB.conf[:PROMPT_MODE] = :SIMPLE
# load libraries
require 'rubygems'
begin
  # load wirble
  require 'wirble'

  # start wirble (with color)
  Wirble.init
  Wirble.colorize
rescue LoadError => err
#  warn "Couldn't load Wirble: #{err}"
end

begin
  require "awesome_print"

  unless IRB.version.include?('DietRB')
    IRB::Irb.class_eval do
      def output_value
        ap @context.last_value
      end
    end
  else # MacRuby
    IRB.formatter = Class.new(IRB::Formatter) do
      def inspect_object(object)
        object.ai
      end
    end.new
  end
rescue LoadError => err
#  warn "Couldn't load awesome_print: #{err}"
end

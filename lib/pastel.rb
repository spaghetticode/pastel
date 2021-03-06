# encoding: utf-8

require 'equatable'
require 'pastel/ansi'
require 'pastel/color'
require 'pastel/color_resolver'
require 'pastel/delegator'
require 'pastel/decorator_chain'
require 'pastel/version'

module Pastel
  # Raised when the style attribute is not supported
  InvalidAttributeNameError = Class.new(::ArgumentError)

  # Create Pastel chainable API
  #
  # @example
  #   pastel = Pastel.new enabled: true
  #
  # @return [Delegator]
  #
  # @api public
  def new(options = {})
    color    = Color.new(options)
    resolver = ColorResolver.new(color)
    Delegator.for(resolver, DecoratorChain.empty)
  end

  module_function :new
end # Pastel

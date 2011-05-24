# encoding: utf-8
begin
  require 'active_support'
rescue LoadError
  gem 'activesupport'
  require 'active_support'
end

begin
  require 'action_view'
rescue LoadError
  gem 'actionpack'
  require 'action_view'
end

module Layou2

  autoload :Helpers,  'layou2/helpers'
  autoload :VERSION,  'layou2/version'

  Error = Class.new(::StandardError)
  NotImplementedYetError = Class.new(::NotImplementedError)

  DEFAULT_DOM_CLASSES = {:title => 'title', :description => 'description'}
  DEFAULT_TITLE_TAG = :h1
  DEFAULT_DESCRIPTION_TAG = :p

  # DOM selectors for easier manipulation of Layou2 titles using CSS/JavaScript.
  mattr_accessor :dom_classes
  @@dom_classes = DEFAULT_DOM_CLASSES

  mattr_accessor :default_title_tag
  @@default_title_tag = DEFAULT_TITLE_TAG

  mattr_accessor :default_description_tag
  @@default_description_tag = DEFAULT_DESCRIPTION_TAG

  class << self

    # Yield self for configuration block:
    #
    #   Layou2.setup do |config|
    #     config.dom_selectors = {}
    #   end
    #
    def setup
      yield(self)
    end

  end

end

# Add extended ActionView behaviour.
ActionView::Base.class_eval do
  include ::Layou2::Helpers
end

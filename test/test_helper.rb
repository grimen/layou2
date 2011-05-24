# encoding: utf-8
require 'rubygems'
require 'bundler'
Bundler.require
$:.unshift File.dirname(__FILE__)

ENV['RAILS_ENV'] = 'test'
TEST_ORM = (ENV['ORM'] || :active_record).to_sym

# ORM / Schema.
require File.join(File.dirname(__FILE__), 'orm', TEST_ORM.to_s)

begin
  require 'leftright'
rescue LoadError
end

require 'mocha'
require 'webrat'

require 'active_support/test_case'
require 'action_view/test_case'

# Support.
Dir[File.join(File.dirname(__FILE__), *%w[support ** *.rb]).to_s].each { |f| require f }

# Dummie-class.
class Unicorn
end

# Routes.
ActionController::Routing::Routes.draw do |map|
  map.resources :ponies, :member => {:kick => :post} do |fraggles|
    fraggles.resources :rainbows, :member => {:kick => :post}
  end
  map.resource :rainbow

  map.root :controller => 'ponies'
end

require 'layou2'

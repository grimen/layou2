# encoding: utf-8
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'integration', 'rails_app', 'config', 'environment'))
require 'test_help'

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.logger = Logger.new(nil)
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')

class Pony < ActiveRecord::Base
end

class Rainbow < ActiveRecord::Base
end

ActiveRecord::Schema.define(:version => 1) do
  create_table :ponies do |t|
    t.string  :name
    t.string  :color
    t.boolean :super_powers
  end

  create_table :rainbows do |t|
    t.string  :name
    t.decimal :intensity
  end

  create_table :dinos do |t|
    t.string  :name
  end
end

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end
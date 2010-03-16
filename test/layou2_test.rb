# encoding: utf-8
require 'test_helper'

class Layou2Test < ActiveSupport::TestCase

  test "#setup: setup block yields self" do
    Layou2.setup do |config|
      assert_equal Layou2, config
    end
  end

  test "#setup: should be configurable using setup helper" do
    swap Layou2, :dom_classes => ({:title => 'boo'}) do
      assert_equal ({:title => 'boo'}), Layou2.dom_classes
    end
  end

end
# encoding: utf-8
require 'test_helper'

class HelpersIntegrationTest < ActionController::IntegrationTest

  test 'Layou2 + Rails = ♥' do
    visit '/'
    assert_response :success
    assert_template 'home/index'

    assert_contain "WIN"
  end

end
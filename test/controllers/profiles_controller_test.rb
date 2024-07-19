# frozen_string_literal: true

require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'should get edit' do
    get profiles_edit_url
    assert_response :success
  end

  test 'should get show' do
    get profiles_show_url
    assert_response :success
  end

  test 'should get update' do
    get profiles_update_url
    assert_response :success
  end
end

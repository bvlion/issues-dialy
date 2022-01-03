# frozen_string_literal: true

require 'test_helper'

module Web
  class Oauth2ControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get web_oauth2_index_url
      assert_response :success
    end
  end
end

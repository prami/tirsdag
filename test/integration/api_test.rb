require 'test_helper'

class ApiTest < ActionDispatch::IntegrationTest
  test "should have /api/todos endpoint" do
    get '/api/todos'
    assert_response :success
  end
end

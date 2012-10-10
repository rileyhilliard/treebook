require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "That the /login route opens the login page" do
    get '/login'
    assert_response :success
  end
end

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "That the /logout route opens the logout page" do
    get '/logout'
    assert_response :redirect
    assert_redirected_to '/'
  end
end

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "That the /register route opens the sign up page" do
    get '/register'
    assert_response :success
  end
end
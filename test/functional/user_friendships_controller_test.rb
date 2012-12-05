require 'test_helper'

class UserFriendshipsControllerTest < ActionController::TestCase
  context "#new" do
    context "When not logged in" do
      should "redirect to the login page" do
        get :new
        assert_response :redirect
      end
    end
    context "when loggin in" do
      setup do
        sign_in users(:riley)
      end
      should "get new and return success" do
        get :new
        assert_response :success
      end
      should "should set a flash eror if the friend_id params is missing" do
        get :new, {}
        assert_equal "Friend required, flash[:error]"
      end
    end
  end  
end

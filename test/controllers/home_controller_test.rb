require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index success" do
    get root_url
    assert_response :success
  end

  test "should sign up success" do
    assert_difference('User.count', 1) do
      post user_registration_path, params: {
        user: {
          email: "abcxyz@gmail.com",
          password: "123123",
          name: "name test"
        }
      }
    end
  end


  test "should login success" do
    User.create! email: "abcxyz@gmail.com", password: "123123", name: "name test"
    post new_user_session_path, params: {
      user: {
        email: "abcxyz@gmail.com",
        password: "123123"
      }
    }
    assert_response :found
  end
end

require "test_helper"

class UserRegistrationTest < ActionDispatch::IntegrationTest
  def setup
    @dummy_user = users(:one)
  end

  test "should get registration form" do
    get new_user_path
    assert_response :success
  end

  test "should create a new user" do
      assert_difference('User.count', 1) do
        post users_path, params: { user: { username: "Dummy User", 
                                           email: "Dummy@email.com" } }
    end
    assert_redirected_to user_path(User.last)
    follow_redirect!
  end

  test "should not create a new user" do
    assert_no_difference('User.count') do
      post users_path params: { user: {
        name: "",
        email: "user@invalid" }
      }
    end
  end
  # test "the truth" do
  #   assert true
  # end
end

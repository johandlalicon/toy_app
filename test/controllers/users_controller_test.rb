require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end




  # test "the truth" do
  #   assert true
  # end
end

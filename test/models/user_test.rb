require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be valid" do
    user = User.new(name: "name test", email: "test@gmail.com", password: "123123")

    assert user.valid?
  end

  test "should be invalid" do
    user = User.new

    assert_not user.valid?
    assert_includes user.errors[:name], "can't be blank"
    assert_includes user.errors[:email], "can't be blank"
    assert_includes user.errors[:password], "can't be blank"
  end

  test "should validate length name" do
    user = User.new(name: "1234567890123456789012345678901", email: "test@gmail.com", password: "123123")
    assert_not user.valid?
    assert_includes user.errors[:name], "is too long (maximum is 30 characters)"
  end
end

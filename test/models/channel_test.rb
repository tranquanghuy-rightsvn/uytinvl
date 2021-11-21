require "test_helper"

class ChannelTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should be valid" do
    channel = @user.channels.new(name: "sang vlog")

    assert channel.valid?
  end

  test "should validate name presence" do
    channel = @user.channels.new

    assert_not channel.valid?
    assert_includes channel.errors[:name], "can't be blank"
  end

  test "should validate length name" do
    channel = Channel.new(name: "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
    assert_not channel.valid?
    assert_includes channel.errors[:name], "is too long (maximum is 50 characters)"
  end
end

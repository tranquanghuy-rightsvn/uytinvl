require "test_helper"

class UsersChannelTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @channel = channels(:one)
  end

  test "should be valid" do
    users_channel = UsersChannel.new(role: "editor",channel: @channel, user: @user)

    assert users_channel.valid?
  end

  test "should be editer" do
    users_channel = UsersChannel.new(channel: @channel, user: @user)

    assert users_channel.editor?
  end
end

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
    assert_includes channel.errors[:name], "không được để trống"
  end

  test "should validate length name" do
    channel = Channel.new(name: "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
    assert_not channel.valid?
    assert_includes channel.errors[:name], "quá dài(tối đa 50 kí tự)"
  end
end

require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @category = categories(:one)
  end

  test "should be valid" do
    post = @user.posts.new(title: "Title test", content: "Content test", category: @category)

    assert post.valid?
  end

  test "should validate title presence" do
    post = @user.posts.new

    assert_not post.valid?
    assert_includes post.errors[:title], "can't be blank"
    assert_includes post.errors[:content], "can't be blank"
  end
end

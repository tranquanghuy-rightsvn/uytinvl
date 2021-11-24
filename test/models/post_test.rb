require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @category = categories(:one)
    @channel = channels(:one)
  end

  test "should be valid" do
    post = @user.posts.new(title: "Title test", content: "Content test",
      category: @category, channel: @channel, 
      image: File.new(Rails.root.join('test/fixtures/files/images.jpeg')))

    assert post.valid?
  end

  test "should validate title presence" do
    post = @user.posts.new

    assert_not post.valid?
    assert_includes post.errors[:image], "không được để trống"
    assert_includes post.errors[:title], "không được để trống"
    assert_includes post.errors[:content], "không được để trống"
  end

  test 'should uploads a file' do
    post  = posts(:one)

    post.update!(image: File.new(Rails.root.join('test/fixtures/files/images.jpeg')))
    assert File.exist?(post.image.current_path)
  end

  test 'should not uploads a file that not image file' do
    post = posts(:one)

    post.image = File.new(Rails.root.join('test/fixtures/files/dummy.txt'))
    post.valid?
    assert_includes post.errors[:image], "không được để trống"
  end
end

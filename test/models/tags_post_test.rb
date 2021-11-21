require "test_helper"

class TagsPostTest < ActiveSupport::TestCase
	 setup do
    @tag = tags(:one)
    @post = posts(:one)
  end

  test "should be valid" do
    tags_post = TagsPost.new(tag: @tag, post: @post)

    assert tags_post.valid?
  end
	
	test "should validate presence" do
    tags_post = TagsPost.new

    assert_not tags_post.valid?
  end

  test "should validate limit tag" do
    5.times do |n|
    	tag = Tag.create! name: "tag #{n}"
    	@post.tags_posts.create! tag: tag
    end

    tag_6 = Tag.create! name: "tag 6"
    tags_post = @post.tags_posts.new tag: tag_6

    assert_not tags_post.valid?, "Mỗi bài post chỉ có tối đa 5 thẻ tag"
  end  
end

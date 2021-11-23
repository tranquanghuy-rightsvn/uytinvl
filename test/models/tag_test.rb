require "test_helper"

class TagTest < ActiveSupport::TestCase
  test "should be valid" do
    tag = Tag.new(name: "name test")

    assert tag.valid?
  end

  test "should be invalid" do
    tag = Tag.new

    assert_not tag.valid?
    assert_includes tag.errors[:name], "không được để trống"
  end
end

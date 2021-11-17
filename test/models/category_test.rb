require "test_helper"

class CategoryTest < ActiveSupport::TestCase
 
  test "should be valid" do
    category = Category.new(name: "name test")

    assert category.valid?
  end

  test "should validate name valid" do
    category = Category.new

    assert_not category.valid?
    assert_includes category.errors[:name], "can't be blank"
  end
end

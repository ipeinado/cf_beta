require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = users(:michael)
  	@post = @user.posts.build(title: "This is an example title",
  									 body: "This is the example body text, it can be as long as you want")
  end

  test "post should be valid" do
  	assert @post.valid?
  end

  test "user id should be present" do
  	@post.user_id = nil
  	assert_not @post.valid?
  end

  test "post should have a title" do
  	@post.title = ""
  	assert_not @post.valid?
  end

  test "post title should not be longer than 255 characters" do
  	@post.title = 'a' * 256
  	assert_not @post.valid?
  end

  test "post should have a body" do
  	@post.body = ""
  	assert_not @post.valid?
  end

end

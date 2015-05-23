require 'test_helper'

class BlogTest < ActionDispatch::IntegrationTest

  test "should display posts#index when visiting 'blog'" do
    get blog_path
    assert_template 'posts/blog'
  end

end

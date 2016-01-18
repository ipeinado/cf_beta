require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  def setup
    @entity = entities(:closefunding)
  end

  test "entity should have a name" do
    @entity.name = ''
    assert_not @entity.valid?, message: "entity should have a name"
  end

  test "bio should not be longer than 255 characters" do
    @entity.bio = 'a' * 256
    assert_not @entity.valid?, message: "bio should not be longer than 255 characters"
  end

end

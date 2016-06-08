require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
      @user = User.new(
        name: "Example User",
        email: "user@example.com",
        password: "foobar",
        password_confirmation: "foobar",
        provider: "identity",
        uid: "455")
  end

  test "user should be valid" do
      assert @user.valid?
  end

  test "name should be present" do
      @user.name = ""
      assert_not @user.valid?, message: "user should have a name"
  end

  test "email should be present" do
      @user.email = ""
      assert_not @user.valid?, message: "user should have an email address"
  end

  test "name should not be too short" do
      @user.name = "abcde"
      assert_not @user.valid?, message: "name should not be too long"
  end

  test "name should not be too long" do
      @user.name = 'a' * 51
      assert_not @user.valid?, message: "name should not be too long"
  end

  test "email should not be too long" do
      @user.email = 'a' * 244 + "@example.com"
      assert_not @user.valid?, message: "email should not be too long"
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
      user_dup = @user.dup
      user_dup.email.upcase!
      @user.save
      assert_not user_dup.valid?, message: "email address should be unique"
  end

  test "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      assert_not @user.valid?, message: "password is too short"
  end

  test "bio should not be longer than 255 characters long" do
    @user.bio = 'a' * 256
    assert_not @user.valid?, message: "bio should not be longer than 255 characters long"
  end

end

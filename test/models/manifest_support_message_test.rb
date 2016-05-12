require 'test_helper'

class ManifestSupportMessageTest < ActiveSupport::TestCase
  test 'responds to name, email, bio, twitter, website' do
    msg = ManifestSupportMessage.new
    [:name, :email, :bio, :twitter, :website].each do |attr|
      assert msg.respond_to? attr
    end
  end

  test 'should accept valid attributes' do
    valid_attrs = {
      name: 'Example name',
      email: 'name@example.com',
      bio: 'here we are, doing our stuff',
      twitter: '@example_name',
      website: 'http://www.example.com'
    }

    msg = ManifestSupportMessage.new valid_attrs

    assert msg.valid?
  end

  test 'attributes can not be blank' do
    msg = ManifestSupportMessage.new
    refute msg.valid?
  end
end

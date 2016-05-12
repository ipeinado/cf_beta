require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "message me" do
    msg = ManifestSupportMessage.new(
      name: 'My personal name',
      email: 'me@example.com',
      twitter: '@myname',
      website: 'http://www.example.com/myname'
    )

    email = MessageMailer.support_message(msg).deliver_now

    refute ActionMailer::Base.deliveries.empty?

    assert_equal ['i.peinado.martinez@gmail.com'], email.to
    assert_equal ['me@example.com'], email.from
    assert_equal 'Nuevo apoyo al Manifiesto Closefunding', email.subject
  end
end

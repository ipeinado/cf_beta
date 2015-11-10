require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @venue = venues(:spinosa)
  end

  test "model is valid" do
    assert @venue.valid?
  end

  test "venue should have a name" do
    @venue.name = ""
    assert_not @venue.valid?, message: "venue should have a name"
  end

  test "venue should have a city" do
    @venue.city = ""
    assert_not @venue.valid?, message: "venue should have a city"
  end

  test "venue should have a country" do
    @venue.country = ""
    assert_not @venue.valid?, message: "venue should have a country"
  end

  test "Twitter is properly formatted" do
    @venue.twitter = "Closefunding"
    @venue.save
    assert_equal "https://twitter.com/Closefunding", @venue.twitter
  end
end

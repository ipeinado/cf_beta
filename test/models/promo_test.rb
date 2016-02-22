require 'test_helper'

class PromoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @promo = promos(:balsamiq)
  end

  test "promo should have a name" do
    @promo.name = ""
    assert_not @promo.valid?, message: "promo should have a name"
  end

  test "promo should have a brief description of the product" do
    @promo.brief_product_description = ""
    assert_not @promo.valid?, message: "promo is missing a brief description of the product"
  end

  test "promo brief product description should be shorter than 255 characters" do
    @promo.brief_product_description = 'a' * 256
    assert_not @promo.valid?, message: "promo brief product description should be shorter than 255 characters"
  end

  test "promo should have a brief description of the promo" do
    @promo.brief_promo_description = ""
    assert_not @promo.valid?, message: "promo is missing a brief description of the advantages of the promo"
  end

  test "brief promo description should not be longer than 255 characters" do
    @promo.brief_promo_description = 'a' * 256
    assert_not @promo.valid?, message: "brief promo description should not be longer than 255 characters"
  end

  test "link should be present" do
    @promo.link = ""
    assert_not @promo.valid?, message: "link should be present"
  end

end

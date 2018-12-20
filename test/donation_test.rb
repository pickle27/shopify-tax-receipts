require "test_helper"

class DonationTest < ActiveSupport::TestCase
  test "only one non void donation per order is allowed" do
    shop = "apple.myshopify.com"
    assert Donation.create(shop: shop, order_id: 1234, donation_amount: 10, void: true).persisted?
    assert Donation.create(shop: shop, order_id: 1234, donation_amount: 10, void: false).persisted?
    refute Donation.create(shop: shop, order_id: 1234, donation_amount: 10, void: false).persisted?
  end
end
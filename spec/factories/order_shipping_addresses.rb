FactoryBot.define do
  factory :order_shipping_address do
    token            {"tk1234"}
    postal_code      {"123-4567"}
    prefecture_id    {1}
    city             {"東京"}
    house_number     {"12-3"}
    building         {"テストビル"}
    phone_number     {"09012345678"}
  end
end

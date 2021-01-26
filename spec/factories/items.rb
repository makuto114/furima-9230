FactoryBot.define do
  factory :item do
    name              {"test"}
    introduction      {Faker::Lorem.sentence}
    category_id       {1}
    condition_id      {1}
    postage_id        {1}
    prefecture_id     {1}
    shipping_days_id  {1}
    price             {500}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
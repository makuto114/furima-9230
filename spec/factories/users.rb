FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {"12345a"}
    password_confirmation {password}
    family_name           {"田中"}
    first_name            {"太郎"}
    family_name_ruby      {"タナカ"}
    first_name_ruby       {"タロウ"}
    birth_date            {"2000-10-10"}
  end
end
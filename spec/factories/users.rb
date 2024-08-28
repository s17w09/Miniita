FactoryBot.define do
  factory :user do
    name { "hogehoge" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
  end
end
  
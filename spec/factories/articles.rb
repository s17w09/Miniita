FactoryBot.define do
  factory :article do
    title { "hogehoge" }
    body { "hogehoge" }
    association :user
  end
end

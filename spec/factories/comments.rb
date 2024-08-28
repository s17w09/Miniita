FactoryBot.define do
  factory :comment do
      body { "hogehoge" }
      association :user
      association :article
    end
end

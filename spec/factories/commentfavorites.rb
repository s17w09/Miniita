FactoryBot.define do
  factory :commentfavorite do
    association :user
    association :comment
  end
end

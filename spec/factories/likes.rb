FactoryBot.define do
  factory :like do
    association :user, factory: :user
    association :micropost, factory: :micropost
  end
end

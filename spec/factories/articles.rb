FactoryBot.define do
  factory :article do
    association :user, factory: :user
  end
end

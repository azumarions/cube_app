FactoryBot.define do
  factory :profile do
    description { 'hello' }

    association :user, factory: :user
  end
end

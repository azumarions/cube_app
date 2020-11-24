FactoryBot.define do
    factory :micropost do
      comment { "rails" }
      picture { nil }
      user_id { 1 }
      created_at { 10.minutes.ago }

      association :user, factory: :user
    end
  end
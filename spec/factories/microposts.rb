FactoryBot.define do
    factory :comments, class: Micropost do
      trait :comment_1 do
        comment { "I just ate an orange!" }
        picture { nil }
        user_id { 1 }
        created_at { 10.minutes.ago }
      end
  
      trait :comment_2 do
        comment { "Check out the @tauday site by mhartl" }
        picture { nil }
        user_id { 1 }
        created_at { 3.years.ago }
      end
  
      trait :comment_3 do
        comment { "Sad cats are sad" }
        picture { nil }
        user_id { 1 }
        created_at { 2.hours.ago }
      end
  
      trait :comment_4 do
        comment { "Writing a short test" }
        picture { nil }
        user_id { 1 }
        created_at { Time.zone.now }
      end
      association :user, factory: :user
    end
  end
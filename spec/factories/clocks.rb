FactoryBot.define do
  factory :clock do
    hour { "00:00:00:00" }
  end
  factory :clocks, class: Clock do
    trait :clock_1 do
      hour { "00:10:23:00" }
      user_id { 1 }
      created_at { 10.minutes.ago }
    end

    trait :clock_2 do
      hour { "00:01:23:00" }
      user_id { 1 }
      created_at { 3.years.ago }
    end

    trait :clock_3 do
      hour { "00:32:24:00" }
      user_id { 1 }
      created_at { 2.hours.ago }
    end

    trait :clock_4 do
      hour { "00:05:34:00" }
      user_id { 1 }
      created_at { Time.zone.now }
    end
    association :user, factory: :user
  end
end

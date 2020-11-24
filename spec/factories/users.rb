FactoryBot.define do
  factory :user do
    sequence(:username) { "test" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    sequence(:password) { "testuser" }
    sequence(:password_confirmation) { "testuser" }
  end

  factory :other_user, class: User do
    username { "Sterling Archer" }
    email { "duchess@example.gov" }
    password { "foobar" }
    password_confirmation { "foobar" }
  end

  factory :no_activation_user, class: User do
    username { "No Activation" }
    email { "no@activation.co.jp" }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end

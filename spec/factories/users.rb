FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "rspec_user_#{n}@lol.com" }
    sequence(:password) { |n| "rspec_secret_#{n}"}
  end
end

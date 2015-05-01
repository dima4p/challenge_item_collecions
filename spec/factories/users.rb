FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@gmail.com" }
    sequence(:name) {|n| "User ##{n}" }
  end
end

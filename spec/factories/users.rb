# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@gmail.com" }
    sequence(:name) {|n| "User ##{n}" }
    password 'password'
    password_confirmation 'password'

    trait :activated do
      active true
    end

    trait :old do
      activated
      current_login_at {5.minutes.ago}
      current_login_ip '213.180.204.3'
      last_login_at {3.days.ago}
      last_login_ip '213.180.193.3'
      last_request_at {2.minutes.ago}
      login_count {rand 5..500}
    end

  end

  factory :active_user, parent: :user, traits: [:activated]

  factory :old_user, parent: :user, traits: [:old]
end

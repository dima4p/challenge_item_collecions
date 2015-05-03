# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  active              :boolean          default(FALSE), not null
#  persistence_token   :string
#  crypted_password    :string
#  password_salt       :string
#  perishable_token    :string
#  single_access_token :string
#  login_count         :integer          default(0), not null
#  failed_login_count  :integer          default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string
#  last_login_ip       :string
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

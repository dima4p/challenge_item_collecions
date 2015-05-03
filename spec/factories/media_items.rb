# == Schema Information
#
# Table name: media_items
#
#  id         :integer          not null, primary key
#  name       :string
#  type       :string
#  user_id    :integer
#  link       :string
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :media_item do
    sequence(:name) {|n| "MediaItem ##{n}" }
    type "LinkItem"
    user { create :user }
    sequence(:link) {|n| "Link #{n}" }
  end

  factory :link_item, parent: :media_item
end

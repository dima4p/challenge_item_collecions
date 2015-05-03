FactoryGirl.define do
  factory :media_item do
    sequence(:name) {|n| "MediaItem ##{n}" }
    type "LinkItem"
    user { create :user }
    sequence(:link) {|n| "Link #{n}" }
  end

  factory :link_item, parent: :media_item
end

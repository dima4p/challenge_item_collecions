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

# Model MediaItem defines the basic class for the collecions
#
class MediaItem < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true, uniqueness: {scope: :user_id}
  validates_inclusion_of :type, in: %w[LinkItem PhotoItem VideoItem]

  scope :ordered, -> { order(:name) }

end

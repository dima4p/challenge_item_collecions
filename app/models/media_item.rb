# Model MediaItem defines the basic class for the collecions
#
class MediaItem < ActiveRecord::Base

  belongs_to :user

  scope :ordered, -> { order(:name) }

end

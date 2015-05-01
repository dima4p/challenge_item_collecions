# Model User defines the peple that will use the service
#
class User < ActiveRecord::Base

  validates :email, :name, presence: true

  scope :ordered, -> { order(:name) }

end

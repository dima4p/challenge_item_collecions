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

# Model User defines the peple that will use the service
#
class User < ActiveRecord::Base

  validates :email, :name, presence: true

  scope :ordered, -> { order(:name) }

end

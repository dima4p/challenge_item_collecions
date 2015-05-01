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

  acts_as_authentic do |config|
    config.merge_validates_length_of_password_field_options minimum: 8
  end

  after_create :set_admin_for_first unless Rails.env.test?

  validates :email, :name, presence: true

  scope :ordered, -> { order(:name) }

  def activate!
    update active: true
  end

  def deliver_activation_instructions!
    reset_perishable_token!
    UserMailer.activation_instructions(self).deliver_now
  end

  def deliver_welcome!
    reset_perishable_token!
    UserMailer.welcome(self).deliver_now
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.password_reset_instructions(self).deliver_now
  end

  def is_tester?
    false
  end

  private

  def set_admin_for_first
    return unless User.limit(2).count == 1
    # self.roles = ['admin']
    self.active = true
    save
  end
end

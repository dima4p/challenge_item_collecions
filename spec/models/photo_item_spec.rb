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

require 'rails_helper'

describe PhotoItem, type: :model do

  subject { create :photo_item }

  it { should be_valid }

end

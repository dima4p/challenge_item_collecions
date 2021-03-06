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

describe MediaItem, type: :model do

  subject { create :media_item }

  it { should be_valid }
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name).scoped_to(:user_id)}
  it {should validate_inclusion_of(:type).in_array(%w[LinkItem PhotoItem VideoItem])}

  describe :class do
    it 'should respond to :ordered' do
      create :media_item
      create :media_item
      expect(MediaItem.ordered).to eq MediaItem.order(:name)
    end
  end

end

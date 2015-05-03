require 'rails_helper'

describe MediaItem, type: :model do

  subject { create :media_item }

  it { should be_valid }

  describe :class do
    it 'should respond to :ordered' do
      create :media_item
      create :media_item
      expect(MediaItem.ordered).to eq MediaItem.order(:name)
    end
  end

end

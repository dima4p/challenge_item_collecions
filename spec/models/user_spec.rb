require 'rails_helper'

describe User, type: :model do

  subject { create :user }

  it { should be_valid }
  it {should validate_presence_of :email}
  it {should validate_presence_of :name}

  describe :class do
    it 'should respond to :ordered' do
      create :user
      create :user
      expect(User.ordered).to eq User.order(:name)
    end
  end

end

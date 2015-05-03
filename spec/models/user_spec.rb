# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  active              :boolean          default(FALSE), not null
#  persistence_token   :string
#  crypted_password    :string
#  password_salt       :string
#  perishable_token    :string
#  single_access_token :string
#  login_count         :integer          default(0), not null
#  failed_login_count  :integer          default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string
#  last_login_ip       :string
#

require 'rails_helper'

describe User, type: :model do

  let(:mock_notifier) do
    (@notifier ||= mock_model('DummyNotifier').as_null_object).tap do |notifier|
      allow(notifier).to receive(:deliver_now).and_return(true)
    end
  end

  subject { create :user }

  it { should be_valid }
  it {should validate_presence_of :email}
  it {should validate_presence_of :name}

  it "validates :email, :presence => true, :format" do
    expect(build(:user, :email => '')).not_to be_valid
    expect(build(:user, :email => 'dima@koulikoff')).not_to be_valid
    expect(build(:user, :email => 'dima.koulikoff.ru')).not_to be_valid
  end

  describe '#activate!' do
    it 'sets the :active attribute' do
      user = create :user
      expect(user.active?).to be_falsy
      user.activate!
      expect(user.active?).to be_truthy
    end
  end

  describe '#deliver_activation_instructions!' do
    it 'assings new perishable_token and mails activation instructions' do
      user = create(:user)
      expect(Authlogic::Random).to receive(:friendly_token).twice.and_return('perishable token')
      expect(UserMailer).to receive(:activation_instructions).with(user).and_return(mock_notifier)
      user.deliver_activation_instructions!
      expect(user.perishable_token).to eq 'perishable token'
    end
  end

  describe '#deliver_password_reset_instructions!' do
    it 'assings new perishable_token and mails password reset instructions' do
      user = create(:user)
      expect(Authlogic::Random).to receive(:friendly_token).twice.and_return('perishable token')
      expect(UserMailer).to receive(:password_reset_instructions).with(user).and_return(mock_notifier)
      user.deliver_password_reset_instructions!
      expect(user.perishable_token).to eq 'perishable token'
    end
  end

  describe '#deliver_welcome!' do
    it 'assings new perishable_token and mails welcome notification' do
      user = create(:user)
      expect(Authlogic::Random).to receive(:friendly_token).twice.and_return('perishable token')
      expect(UserMailer).to receive(:welcome).with(user).and_return(mock_notifier)
      user.deliver_welcome!
      expect(user.perishable_token).to eq 'perishable token'
    end
  end

  describe '#is_tester?' do
    it 'returns false' do
      expect(subject.is_tester?).to be false
    end
  end

  describe :class do
    it 'should respond to :ordered' do
      create :user
      create :user
      expect(User.ordered).to eq User.order(:name)
    end
  end

end

require 'rails_helper'

# FIXME:
class Setting
  def self.main_mail_from
    'veronica@applift.com'
  end
end

RSpec.describe UserMailer, :type => :mailer do
  before :each do
    ActionMailer::Base.default_url_options = {host: 'core.info', locale: :en}
  end

  describe "activation_instructions" do
    let(:user) {create :user, perishable_token: 'pcode'}
    let(:mail) {UserMailer.activation_instructions user}

    it "should be delivered to the user's email" do
      expect(mail.to).to eq([user.email])
    end

    it "should be delivered from #{Setting.main_mail_from}" do
      expect(mail.from).to eq([Setting.main_mail_from])
    end

    it "has the subject Item collecions: Activation Instructions" do
      expect(mail.subject).to eq("Item collecions: Activation Instructions")
    end

    it "renders the activation link in the body" do
      expect(mail.body.encoded).to include("http://core.info/activate/#{user.perishable_token}")
    end
  end

  describe "password_reset_instructions" do
    let(:user) {create :user}
    let(:mail) {UserMailer.password_reset_instructions user}

    it "should be delivered to the user's email" do
      expect(mail.to).to eq([user.email])
    end

    it "should be delivered from #{Setting.main_mail_from}" do
      expect(mail.from).to eq([Setting.main_mail_from])
    end

    it "should have subject Item collecions: Password Reset Instructions" do
      expect(mail.subject).to eq("Item collecions: Password Reset Instructions")
    end

    it "renders the password reset link in the body" do
      expect(mail.body.encoded).to include("http://core.info/password_resets/#{user.perishable_token}/edit")
    end

  end

  describe "welcome" do
    let(:user) {create :user}
    let(:mail) {UserMailer.welcome user}

    it "should be delivered to the user's email" do
      expect(mail.to).to eq([user.email])
    end

    it "should be delivered from #{Setting.main_mail_from}" do
      expect(mail.from).to eq([Setting.main_mail_from])
    end

    it "should have subject Item collecions: Welcome!" do
      expect(mail.subject).to eq("Item collecions: Welcome!")
    end

    it "should have link to the root" do
      expect(mail.body.encoded).to include("http://core.info")
    end
  end

end

# This is the main mailer to notify Users
class UserMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_instructions.subject
  #
  def activation_instructions(user)
    @user = user
    @url = activate_url :code => user.perishable_token
    mail :to => user.email,
         :subject => I18n.t(:application_name) + ': ' + I18n.t(:activation_instructions)
  end

  def password_reset_instructions(user)
    @url = edit_password_reset_url(user.perishable_token)
    mail :to => user.email,
         :subject => I18n.t(:application_name) + ': ' + I18n.t(:password_reset_instructions)
  end

  def welcome(user)
    @url = root_url
    mail :to => user.email,
         :subject => I18n.t(:application_name) + ': ' + I18n.t(:welcome)
  end

end

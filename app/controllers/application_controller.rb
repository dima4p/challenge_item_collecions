class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include AuthenticationHelper

  before_action :set_hostname

  rescue_from CanCan::AccessDenied do # |exception|
    flash[:error] = t :access_denied
    respond_to do |format|
      format.html do
        store_target_location
        redirect_to login_url
      end
      format.json {head :unauthorized}
    end
  end

  private

  def set_hostname
    @hostname = request.host
    port = request.port
    @hostname << ":#{port}" if port != 80
    Rails.application.config.action_mailer.default_url_options =
      {host: @hostname, locale: I18n.locale}
    ActionMailer::Base.default_url_options[:host] = @hostname
    ActionMailer::Base.default_url_options[:locale] = I18n.locale
    logger.debug "ApplicationController@#{__LINE__}#set_hostname #{ActionMailer::Base.default_url_options.inspect}" if logger.debug? # rubocop:disable Metrics/LineLength
  end
end

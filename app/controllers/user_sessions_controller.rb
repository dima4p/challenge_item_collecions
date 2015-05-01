class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t 'authlogic.logged_in',
          name: @user_session.record.name
      redirect_to_target_or_default(root_url)
    else
      logger.info "UserSessionsController#create@#{__LINE__} #{@user_session.errors.inspect} invalid"
      ([:login, :password] - @user_session.errors.keys).each do |key|
        mkey = key == :login ? 'login_not_found' : 'password_invalid'
        @user_session.errors[key] = t "authlogic.error_messages.#{mkey}"
      end
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = t 'authlogic.lgged_out'
    redirect_to root_url
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_tester?
      can :manage, :all
    else
      can :manage, UserSession
      can :create, User if user.new_record?

      return if user.new_record?

      # User
      can [:show, :update, :show_login_info, :show_email], User, id: user.id
      can [:index], User, active: true
      cannot :create, User
    end

  end
end

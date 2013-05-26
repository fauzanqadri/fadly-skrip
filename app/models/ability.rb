class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    send(@user.role) unless (@user.role.nil? || @user.role.blank? )
    # cannot :manage, :all
  end
  
  def admin
    can :manage, User
  end
  
  def director
    can :read, Nasabah
    can :update, Nasabah
  end
  
  def cs
    can :manage, Nasabah
  end
  
  def teller
  end
end

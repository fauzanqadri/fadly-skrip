class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    send(@user.role) unless (@user.role.nil? || @user.role.blank? )
    cannot :manage, :all
  end
  
  def admin
    can :manage, User
  end
  
  def director
  end
  
  def cs
  end
  
  def teller
  end
end

class User < ActiveRecord::Base
  ROLES = %w[admin director cs teller]
  self.per_page = 10
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nama_lengkap, :role, :nik, :archives
  attr_accessor :login
  attr_accessor :login
  #before_create :archive_defaults
  # attr_accessible :title, :body
  
  def self.get_all
    self.where(:archives => false)
  end
  
  def self.new_inside params
    timestamp = Time.now.to_i
    new_user = self.new params
    new_user.archives = false
    new_user.nik = timestamp.to_s
    new_user.password = timestamp.to_s
    new_user.password_confirmation =  timestamp.to_s
    new_user
  end
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(nik) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
  def self.make_archives id
    u = self.find(id)
    u.update_attributes(:archives => true)
  end
  
end

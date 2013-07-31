class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :role, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  # ROLES = %w[admin moderator author banned]  


  def admin?
  	self.role == "admin" || self.email == 'admin@mycrm.com'
  end

  def operator?
    self.role == "operator"
  end

end

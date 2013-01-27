class User < ActiveRecord::Base
  
  # => Devise Modules
  devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :trackable, :validatable,
              :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me
                  
  
  
    def admin?
      self.email.match(/^admin@ce.com$/)
    end                
end

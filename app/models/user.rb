class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :wikis
  
  after_create :welcome_send
  
  enum role: [:standard, :premium, :admin]
  
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :standard
  end

  def welcome_send
    WelcomeMailer.welcome_send(self).deliver_now
  end
  
end
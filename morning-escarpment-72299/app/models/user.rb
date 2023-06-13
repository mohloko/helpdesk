class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 200 }, format: { with: VALID_EMAIL_REGEX }
  validates	:password,	length:	{minimum:	3}, allow_blank: true
  has_secure_password
  
  has_many :tickets, dependent: :destroy
  
  
  
end

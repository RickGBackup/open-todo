class User < ActiveRecord::Base
  has_many :lists
  has_many :items
    
  validates :name, 
            length: { minimum: 1, maximum: 100 }, 
            presence: true,
            uniqueness: { case_sensitive: false }
            
  validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest   
  validates :password, length: { minimum: 6 }, allow_blank: true  

  has_secure_password 
end

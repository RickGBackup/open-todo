class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  
  validates :name, 
            length: { minimum: 1, maximum: 250 }, 
            presence: true
end

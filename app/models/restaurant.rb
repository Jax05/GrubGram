class Restaurant < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    
    has_many :photos
    has_many :users, through: :photos
end

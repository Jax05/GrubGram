class User < ApplicationRecord
    has_many :photos
    has_many :restaurants, through: :photos
end

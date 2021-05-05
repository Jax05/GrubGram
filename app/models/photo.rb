class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  accepts_nested_attributes_for :restaurant
end

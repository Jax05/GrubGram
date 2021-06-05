class Photo < ApplicationRecord
  validates :url, presence: true
  validates :rating, numericality: true

  belongs_to :user
  belongs_to :restaurant

  scope :latest_photos, -> {order(created_at: :desc)}

  def restaurant_id=(restaurant_id)
    if restaurant_id
      self.restaurant = Restaurant.find_by(id: restaurant_id)
    end
  end

  # We use a custom writer instead of accepts_nested_attributes_for so we don't create duplicate restaurant instances
  # using the values submitted in our new photo form
  def restaurant_attributes=(restaurant_attributes)
    if !restaurant_attributes["name"].blank?
      self.restaurant = Restaurant.find_or_create_by(restaurant_attributes)
    end
  end
end

class AddRestaurantsToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_reference :photos, :restaurant, null: false, foreign_key: true
  end
end

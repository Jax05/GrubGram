class AddRatingToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :rating, :float
  end
end

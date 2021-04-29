class RemoveRatingFromRestaurants < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :rating, :float
  end
end

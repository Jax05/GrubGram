class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :url
      t.text :description
      t.float :rating
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :rank
      t.string :name
      t.integer :rating
      t.string :address
      t.string :city
      t.string :phone
      t.integer :review_count
      t.string :url
      t.string :price
      t.string 'photos', array: true, default: []
    end
  end
end

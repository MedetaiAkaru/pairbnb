class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :location
      t.text :address
      t.integer :number_of_guests
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.boolean :pets
      t.boolean :smoker
      t.integer :price
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :price
      t.text :specialrequest
      t.integer :number_of_guest
      t.integer :total

      t.timestamps null: false
    end
  end
end

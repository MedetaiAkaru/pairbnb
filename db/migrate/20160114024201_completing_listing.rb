class CompletingListing < ActiveRecord::Migration
  def change
    add_column :listings, :hometype, :string
    add_column :listings, :roomtype, :string
    add_column :listings, :number_of_beds, :string
    add_column :listings, :bedtype, :string
    add_column :listings, :listingname, :string
    add_column :listings, :summary, :text
    add_column :listings, :country, :string
    add_column :listings, :city, :string
    add_column :listings, :address2, :string
    add_column :listings, :state, :string
    add_column :listings, :zipcode, :string
    add_column :listings, :essentials, :boolean
    add_column :listings, :tv, :boolean
    add_column :listings, :cabletv, :boolean
    add_column :listings, :aircond, :boolean
    add_column :listings, :heating, :boolean
    add_column :listings, :kitchen, :boolean
    add_column :listings, :internet, :boolean
    add_column :listings, :wireless, :boolean
    add_column :listings, :anytime, :boolean
    add_column :listings, :hottub, :boolean
    add_column :listings, :washer, :boolean
    add_column :listings, :pool, :boolean
    add_column :listings, :dryer, :boolean
    add_column :listings, :breakfast, :boolean
    add_column :listings, :freeparking, :boolean
    add_column :listings, :gym, :boolean
    add_column :listings, :elevator, :boolean
    add_column :listings, :fireplace, :boolean
    add_column :listings, :intercom, :boolean
    add_column :listings, :doorman, :boolean
    add_column :listings, :shampoo, :boolean
    add_column :listings, :hangers, :boolean
    add_column :listings, :hairdryer, :boolean
    add_column :listings, :iron, :boolean
    add_column :listings, :laptopfriendly, :boolean
    add_column :listings, :familyfriendly, :boolean
    add_column :listings, :smoking, :boolean
    add_column :listings, :events, :boolean
    add_column :listings, :petsin, :boolean
    add_column :listings, :wheelchair, :boolean
    add_column :listings, :smokedetector, :boolean
    add_column :listings, :carbonmonoxide, :boolean
    add_column :listings, :firstaid, :boolean
    add_column :listings, :safetycard, :boolean
    add_column :listings, :extinguisher, :boolean
    add_column :listings, :extinguisherlocation, :string
    add_column :listings, :firealarmlocation, :string
    add_column :listings, :gasshutofflocation, :string
    add_column :listings, :emergencyexit, :text
    add_column :listings, :emergencyphone, :string
    add_column :listings, :thespace, :string
    add_column :listings, :guestaccess, :string
    add_column :listings, :interactions, :string
    add_column :listings, :otherthings, :string
    add_column :listings, :houserules, :string
    add_column :listings, :neighbouroverview, :string
    add_column :listings, :neighbourgettingaround, :string
    add_column :listings, :currency, :string
    add_column :listings, :bookingmode, :boolean
    add_column :listings, :availablemode, :boolean
    add_column :listings, :number, :string
  end
end
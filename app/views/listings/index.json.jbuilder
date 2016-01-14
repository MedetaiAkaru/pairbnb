json.array!(@listings) do |listing|
  json.extract! listing, :id, :location, :address, :number_of_guests, :number_of_bedrooms, :number_of_bathrooms, :pets, :smoker, :price, :user_id
  json.url listing_url(listing, format: :json)
end

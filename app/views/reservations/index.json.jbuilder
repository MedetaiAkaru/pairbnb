json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :user_id, :listing_id, :start_date, :end_date, :price, :specialrequest, :number_of_guest, :total
  json.url reservation_url(reservation, format: :json)
end

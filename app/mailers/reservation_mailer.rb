class ReservationMailer < ApplicationMailer
		def booking_email(customer, host, reservation_id)
			#Define a variable @url that points to the reservation show page with details for the reservation
			@url = "http://localhost:3000/reservations/#{reservation_id}"
			@host = host
			@customer = customer
			mail(to: @host.email, subject: "You have received a booking from #{@customer.name}")
		end
end

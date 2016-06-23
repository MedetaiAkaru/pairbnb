# app/jobs/reservation_job.rb

class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(customer_id, host_id, reservation_id) #keep the objects you pass into the method as arguments to be as simple as possible since we're storing these objects in a queue.
    # do something here, e.g. @customer = User.find(customer_id) etc...
    @customer = User.find(customer_id)
    @host = User.find(host_id)
    @reservation_id = reservation_id
    ReservationMailer.booking_email(@customer, @host, @reservation_id).deliver_now
  end
end
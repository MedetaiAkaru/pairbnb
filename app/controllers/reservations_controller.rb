class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    # @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  def preload
    listing = Listing.find(params[:listing_id])
    today = Date.today
    reservations = listing.reservations.where("start_date >= ? OR end_date >= ?", today, today) 
  
    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: is_conflict(start_date, end_date)
    }

    render json: output
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = current_user.reservations.new(reservation_params)
    #Define your @customer and @host variables here. THis would depend on how your user model was previously designed
    @customer = @reservation.user.id
    @host = @reservation.listing.user.id
    @reservation_id = @reservation.id
    byebug
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
        #Tell the ReservationMailer to send a booking email after save
        #Pass in your customer, host and reservation id variables to your mailer
        ReservationJob.perform_later(@customer, @host, @reservation_id)
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date, :price, :specialrequest, :number_of_guest, :total)
    end

    def is_conflict(start_date, end_date)
      listing = Listing.find(params[:listing_id])

      check = listing.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
      check.size > 0? true: false
    end
end

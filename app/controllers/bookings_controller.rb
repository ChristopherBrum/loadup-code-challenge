class BookingsController < ApplicationController
  include BookingsHelper
  include PricingEngine

  def index
    @bookings = Booking.order(created_at: :desc)
  end
  
  def new
    @booking = Booking.new
  end

  def show
    unless validParamId?(params[:id]) 
      redirect_to bookings_path, alert: 'Booking ID is invalid.'
      return
    end

    begin
      @booking = Booking.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to bookings_path, alert: 'Booking ID does not exist.'
    end
  end  

  def create
    price = calculate_price(booking_params["animal_type"], booking_params["hours_requested"])
    
    @booking = Booking.new(booking_params)
    @booking.price = price
  
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end  

  def destroy
    @booking = Booking.find(params[:id])

    if @booking.destroy
      redirect_to bookings_path, notice: 'Booking was successfully deleted.'
    else 
      redirect_to bookings_path, alert: 'Failed to delete booking.'
    end
  end

  private 

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :animal_name, :animal_type, :hours_requested, :date_of_service)
  end
end

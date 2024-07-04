class BookingsController < ApplicationController
  include BookingsHelper

  def index
    @bookings = Booking.order(created_at: :desc)
    p @bookings[0]
  end
  
  def new
    @booking = Booking.new
  end

  def show()
    @booking = Booking.find(params[:id])
  end

  def create    
    price = calculatePrice(booking_params["animal_type"], booking_params["hours_requested"])
    
    @booking = Booking.new(booking_params)
    @booking.price = price

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])

    p "------------"
    p params
    p "------------"

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

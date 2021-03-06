class BookingsController < ApplicationController
  def index
    bookings = Booking.all

    render json: bookings
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def show
    @bookings = Booking.where(user_id: @current_user)
    render json: @bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :barber_id, :book_time)
  end
end

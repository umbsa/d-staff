class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @staff = Staff.find(params[:staff_id])
    # binding.pry
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to staff_reservations_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:title, :content, :start_time).merge(staff_id: params[:staff_id], user_id: current_user.id)
  end
end

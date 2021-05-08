class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :destroy]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @staff = Staff.find(params[:staff_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to staff_reservations_path
    else
      render :new
    end
  end

  def edit
    @staff = Staff.find(params[:staff_id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :start_time).merge(staff_id: params[:staff_id], user_id: current_user.id)
  end
end

class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_staff, only: [:create, :edit]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @user = User.find(reservation_params[:user_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      VerificationMailer.email_to_users(@user,@reservation,@staff).deliver
      redirect_to staff_reservations_path
    else
      render :new
    end
  end

  def edit
  end

  private
  def reservation_params
    params.require(:reservation).permit(:prefecture_id, :postal_code, :city, :addresses, :building, :phone_number, :start_time).merge(staff_id: params[:staff_id], user_id: current_user.id)
  end

  def set_staff
    @staff = Staff.find(params[:staff_id])
  end


end


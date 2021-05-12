class VerificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @reservations = Reservation.all
  end

  private
  def move_to_index
    unless current_user.admin
      redirect_to root_path
    end
  end
end

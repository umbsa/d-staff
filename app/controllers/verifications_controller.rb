class VerificationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
end

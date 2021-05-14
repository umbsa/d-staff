class CardsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def newcard
    @staff = Staff.find(params[:id])
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
    description: 'test',
    card: params[:card_token]
    )

    card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      user_id: current_user.id
    )

    if card.save
      redirect_to root_path
    else
      redirect_to action: "new"
    end
  end


  def createcard
    @staff = Staff.find(params[:id])

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
    description: 'test',
    card: params[:card_token]
    )

    card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      user_id: current_user.id
    )

    if card.save
      redirect_to credit_staff_path(@staff)
    else
      redirect_to action: "newcard"
    end
  end
end

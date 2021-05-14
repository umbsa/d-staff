class StaffsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:new, :edit, :destroy, :update]


  def index
    @staffs = Staff.all
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def search
    @staffs = Staff.search(params[:search])
  end

  def edit
  end

  def update
    if @staff.update(staff_params)
      redirect_to staff_path
    else
      render 'edit'
    end
  end

  def destroy
    if @staff.destroy
      redirect_to root_path
    end
  end

  def order
    @staff = Staff.find(params[:id])
    redirect_to newcard_card_path(@staff) and return unless current_user.card.present?

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @staff.price, # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )

    StaffOrder.create(staff_id: params[:id])
    redirect_to root_path
  end

  def credit
    @staff = Staff.find(params[:id])
  end


  private

  def staff_params
    params.require(:staff).permit(:name, :history, :comment, :hobby, :image, :price)
  end

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def move_to_index
    unless current_user.admin
      redirect_to action: :index
    end
  end

end


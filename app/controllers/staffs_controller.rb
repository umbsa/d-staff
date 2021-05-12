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


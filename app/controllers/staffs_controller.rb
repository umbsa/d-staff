class StaffsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]


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
    @staff = Staff.find(params[:id])
  end

  def search
    @staffs = Staff.search(params[:search])
  end

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      redirect_to staff_path
    else
      render 'edit'
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    if @staff.destroy
      redirect_to root_path
    end
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :history, :comment, :hobby, :image)
  end

end


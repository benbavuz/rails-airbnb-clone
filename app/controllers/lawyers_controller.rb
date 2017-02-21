class LawyersController < ApplicationController

  before_action :set_lawyer, only [:show, :edit, :update, :destroy]


  def index
    @lawyers = Lawyer.all
  end

  def show
  end

  def new
    @lawyer = Lawyer.new
  end

  def create
    @lawyer = Lawyer.new(lawyer_params)
    @lawyer.save
  end

  def edit
  end

  def update
    @lawyer.update(params[:lawyer])
  end

  def destroy
    @lawyer.destroy
  end

  private

  def lawyer_params
  params.require(:lawyer).permit(:first_name, :last_name, :email, :phone_number)
  end

  def set_lawyer
    @lawyer = Lawyer.find(params[:id])
  end

end

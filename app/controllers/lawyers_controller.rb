class LawyersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_lawyer, only: [:show, :edit, :update, :destroy, :add_speciality]

 # action linked to all users
  def index
    @lawyers = Lawyer.all
  end

  def show
  end

  #actions linked to specific user

  def index_by_user
    @user = User.find(params[:user_id])
    @lawyers = @user.lawyers
  end

  def new
    @lawyer = Lawyer.new
  end

  def create
    @lawyer = Lawyer.new(lawyer_params)
    @lawyer.user = current_user
    @lawyer.save!
    redirect_to user_lawyers_path(user_id: @lawyer.user.id)
  end

  # to be coded later
  # def edit
  # end

  # def update
  #   @lawyer.update(lawyer_params)
  #   redirect_to lawyers_path
  # end

  # def destroy
  #   if @lawyer.user == current_user
  #     @lawyer.destroy
  #   end
  # end

  private

  def lawyer_params
  params.require(:lawyer).permit(:first_name, :last_name, :email, :phone_number, speciality_ids: [])
  end

  def set_lawyer
    @lawyer = Lawyer.find(params[:id])
  end

end

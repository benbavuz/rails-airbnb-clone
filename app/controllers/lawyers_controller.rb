class LawyersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_lawyer, only: [:show, :edit, :update, :destroy]

 # action linked to all users
  def index

    if params[:location].present?
      @lawyers = Lawyer.near(params[:location])
    else
      @lawyers = Lawyer.where.not(latitude: nil, longitude: nil)
    end

    @hash = Gmaps4rails.build_markers(@lawyers) do |lawyer, marker|
      marker.lat lawyer.latitude
      marker.lng lawyer.longitude
      marker.infowindow render_to_string(partial: "lawyers/infowindow", locals: { lawyer: lawyer })
    end
  end

  def show
    @lawyers = []
    @lawyers[0] = @lawyer
    @hash = Gmaps4rails.build_markers(@lawyers) do |lawyer, marker|
      marker.lat lawyer.latitude
      marker.lng lawyer.longitude
    end
  end

  #actions linked to specific user

  def index_by_user
    @user = User.find(params[:user_id])
    @lawyers = @user.lawyers
  end

  def new
    @lawyer = Lawyer.new
    @lawyer.first_name = current_user.first_name
    @lawyer.last_name = current_user.last_name
    @lawyer.email = current_user.email
    @lawyer.phone_number = current_user.phone_number

  end

  def create
    @lawyer = Lawyer.new(lawyer_params)
    @lawyer.user = current_user
    # @lawyer.office_photo = blank_image(@lawyer)
    @lawyer.save!
    redirect_to user_lawyers_path(user_id: @lawyer.user.id)
    # if @lawyer.save
    #   LawyerMailer.confirmation(@lawyer).deliver_now
    # else
    #   render :new
    # end
  end

  def edit
  end

  def update
    if @lawyer.user == current_user
      @user = @lawyer.user
      @lawyer.update(lawyer_params)
      redirect_to user_lawyers_path(user_id: @lawyer.user.id)
    end
  end

  def destroy
    if @lawyer.user == current_user
      @user = @lawyer.user
      @lawyer.destroy
      redirect_to user_lawyers_path(user_id: @lawyer.user.id)
    end
  end

  private

  def lawyer_params
  params.require(:lawyer).permit(:first_name, :last_name, :email, :address, :phone_number, :photo, :office_photo, :zip_code,:city, :country, :price, speciality_ids: [])
  end

  def set_lawyer
    @lawyer = Lawyer.find(params[:id])
  end

  # def blank_image(lawyer)
  #   if lawyer.office_photo == nil
  #     'https://askthelaw.ae/wp-content/uploads/2016/12/law-office-lawyers-in-your-city.jpg'
  #   else
  #     lawyer.office_photo
  #   end
  # end

end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout Proc.new { |controller| controller.devise_controller? ? "devise" : "application" }

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

end

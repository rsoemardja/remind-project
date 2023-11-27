class ApplicationController < ActionController::Base
    before_action :authenticate_user!

 protected

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :email, :admin, :company])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :email, :admin, :company])
  end
end

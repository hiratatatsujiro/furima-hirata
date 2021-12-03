class ApplicationController < ActionController::Base
  before_action :devise_parameter_sanitizer,if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
                                      keys: [:nickname, :last_name, :first_name, :last_name_reading, :first_name_reading, :birthday])
  end
end

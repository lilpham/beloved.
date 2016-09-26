class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :setup_devise_parameters, if: :devise_controller?
                      
  protected

  
  def setup_devise_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :fiance_name, :wedding_date])
  	# devise_parameter_sanitizer.permit(:account_update, keys: [:fiance_name, :wedding_date])
  end
  
end

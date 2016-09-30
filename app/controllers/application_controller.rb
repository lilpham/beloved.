class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :setup_devise_parameters, if: :devise_controller?
	before_filter :set_time_zone, :set_beginning_week, if: :user_signed_in?

  private

    def set_time_zone
      Time.zone = 'Eastern Time (US & Canada)'
    end

    def set_beginning_week
    	Date.beginning_of_week = :sunday
    end

  protected
  
  def setup_devise_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :fiance_name, :wedding_date])
  end
  
end

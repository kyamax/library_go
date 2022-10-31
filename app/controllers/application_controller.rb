class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:grade_id, :class_num_id, :number_id, :name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:grade_id, :class_num_id, :number_id])
  end
end

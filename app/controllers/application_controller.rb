class ApplicationController < ActionController::Base
  before_action :devise_parameter_sanitizer, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:school, :grade_id, :class_num_id, :number_id, :name, :employee_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:grade_id, :class_num_id, :number_id, :employee_id])
  end

  def devise_parameter_sanitizer
    if resource_class == User
      Users::UserSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end
end

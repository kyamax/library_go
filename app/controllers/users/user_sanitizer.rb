# class User::ParameterSanitizer < Devise::ParameterSanitizer
class Users::UserSanitizer < Devise::ParameterSanitizer

  def initialize(*)
    super
    permit(:sign_up, keys: [:school_id, :grade_id, :class_num_id, :number_id, :name])
    permit(:sign_in, keys: [:grade_id, :class_num_id, :number_id])
  end
end

class UserParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:school_id, :grade_id, :class_num_id, :number_id, :name)
  end

  def sign_in
    default_params.permit(:grade_id, :class_num_id, :number_id)
  end
end
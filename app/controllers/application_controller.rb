class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email password password_confirmation name cpf course_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password password_confirmation name cpf course_id])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email password password_confirmation current_password name cpf
                                               course_id])
  end
end

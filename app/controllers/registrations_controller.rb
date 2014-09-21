class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
         devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email) }
         devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :name_of_page, :password, :password_confirmation) }
         devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :name_of_page, :password, :password_confirmation, :current_password) }
  end
end
class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pagy::Backend
  def after_sign_in_path_for(current_user)
    dashboard_index_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, owned_organization_attributes: [:name, :subdomain]])

    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, owned_organization_attributes: [:name, :subdomain]])
  end
end

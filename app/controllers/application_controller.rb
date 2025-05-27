class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  set_current_tenant_by_subdomain(:organization, :subdomain)
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pagy::Backend
  def after_sign_in_path_for(resource)
    if resource.organization_owner?
      dashboard_index_url(subdomain: resource.owned_organization.subdomain.downcase)
    else
      dashboard_index_url(subdomain: resource.organization.subdomain.downcase)
    end
  end

  protected
  def authenticate_owner!
    unless current_user.organization_owner?
      flash[:alert] = "You are not authorized to perform this action!"
      redirect_back_or_to(root_path)
    end
  end

  def authenticate_owner_or_team_leader!
    unless current_user.organization_owner? || current_user.has_role?(:team_leader)
      flash[:alert] = "You are not authorized to perform this action!"
      redirect_back_or_to(root_path)
    end
  end

  def require_subscription!
    unless current_user.payment_processor.subscribed?
      flash[:alert] = "Upgrade to access this feature!"
      redirect_to subscriptions_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :full_name, owned_organization_attributes: [ :name, :subdomain ] ])

    devise_parameter_sanitizer.permit(:account_update, keys: [ :full_name, owned_organization_attributes: [ :name, :subdomain ] ])
  end
end

class Admin::DashboardController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def impersonate
    user = User.find(params[:id])
    impersonate_user(user)
    redirect_to dashboard_index_url(subdomain: user.owned_organization.subdomain.downcase), allow_other_host: true
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to admin_dashboard_index_url(subdomain:""), allow_other_host: true
  end
end

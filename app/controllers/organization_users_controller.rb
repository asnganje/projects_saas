class OrganizationUsersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  def index
    @users = current_tenant.users
  end
end

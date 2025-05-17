class SearchController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  def index
    @projects =Project.where(name: params[:name])
  end
end

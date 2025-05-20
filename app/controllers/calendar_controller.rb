class CalendarController < ApplicationController
  before_action :authenticate_user!
  layout "admin"
  def index
  end
end

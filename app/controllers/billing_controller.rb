class BillingController < ApplicationController
  before_action :authenticate_user!
  def portal
    @portal_session = current_user.payment_processor.billing_portal
    redirect_to @portal_session.url, allow_other_host: true, status: :see_other
  end
end

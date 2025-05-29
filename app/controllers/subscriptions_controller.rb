class SubscriptionsController < ApplicationController
  # layout "admin"
  before_action :authenticate_user!

  def new
    if current_user.payment_processor.nil? || current_user.payment_processor.processor_id.blank?
    # Create new customer if none exists
    current_user.create_payment_processor!(processor: :stripe)
    else
      begin
        Stripe::Customer.retrieve(current_user.payment_processor.processor_id)
      rescue Stripe::InvalidRequestError => e
        if e.message.include?("No such customer")
          # Delete the invalid local record
          Pay::Customer.where(id: current_user.payment_processor.id).delete_all

          # Create a new Stripe customer record in DB and Stripe
          current_user.create_payment_processor!
        else
          raise
        end
      end
    end

  session = Stripe::Checkout::Session.create(
    mode: "subscription",
    locale: I18n.locale.to_s,
    payment_method_types: [ "card" ],
    customer: current_user.payment_processor.processor_id,
    line_items: [ {
      price: params[:price],
      quantity: 1
    } ],
    success_url: dashboard_index_url + "?session_id={CHECKOUT_SESSION_ID}",
    cancel_url: root_url
  )

  redirect_to session.url, allow_other_host: true, status: :see_other
  end

  def index
  end
end

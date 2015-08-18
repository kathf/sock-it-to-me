class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def create
    @order = Order.create(order_params)
    generate_payment_reference
    stripe_charge
    clear_location_store
    redirect_to order_path(@order)
  end

  private

  def clear_location_store
    session[:user_return_to] = "/"
  end

  def stripe_charge
    begin
      charge = Stripe::Charge.create(
        amount: @order.amount, # in cents
        currency: "aud",
        source: @order.stripe_token,
        description: @order.description
      )
      @order.paid = true
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end

  def generate_payment_reference
    @order.payment_reference = Time.now.to_i.to_s + rand(99).to_s
    @order.save
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:sock_id, :stripe_token, :amount, :description)
  end

end

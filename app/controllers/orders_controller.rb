class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def create
    @order = Order.create(order_params)
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
      payment_successful(charge) if charge.paid
    rescue Stripe::CardError => e
      flash[:notice] = e.message
    rescue => e
      flash[:notice] = "Some other error occured"
    end
    byebug
  end

  def payment_successful(charge)
    @order.paid = true
    @order.payment_reference = charge.id
    @order.save
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:sock_id, :stripe_token, :amount, :description)
  end

end

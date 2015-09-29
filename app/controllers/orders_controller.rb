class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:payment, :submit_payment, :show]

  def show
  end

  def payment
  end

  def submit_payment
    # Amount in cents
    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end

  private

  def set_order
    @order = current_user.cart
  end

  def amount
    @line_items = LineItem.where(order_id: current_user.cart.order)
    @line_items.each { |line_item| @amount += line_item.price }
    @amount
  end
  
end

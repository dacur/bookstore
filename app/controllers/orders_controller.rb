class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:payment, :submit_payment, 
    :show, :edit, :index, :confirm_order]
  
  def show
  end

  def create
  end

  def payment
  end

  def submit_payment
    if @order.user.stripe_customer_token.nil?
      @order.user.stripe_card_token = params[:user][:stripe_card_token]
      @order.user.save_card
    end
    @order.user.update(user_params)
    render :confirmation # renders Order Confirmation page
  end

  def confirm_order
    if @order.save_with_payment
      OrderMailer.send_invoice(current_user,@order).deliver_now
      redirect_to @order, notice: "Your order has been placed and will ship soon."
    else
      redirect_to @order, alert: "There was an error with placing your order: #{@order.errors.full_messages.to_sentence}"
    end
  end

  private

  def set_order
    @order = current_user.cart
  end

  def user_params
    params.require(:user).permit(:billing_address, :shipping_address, :email)
  end

  def amount
    @line_items = LineItem.where(order_id: current_user.cart.order)
    @line_items.each { |line_item| @amount += line_item.price }
    @amount
  end
  
end

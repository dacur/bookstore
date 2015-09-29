class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    order = current_user.cart
    item = LineItem.create(line_item_params.merge!(order_id: order.id))
    @line_items = LineItem.where(order: order)
    redirect_to "/cart"
  end

  def show
    order = current_user.cart
    @line_items = LineItem.where(order: order)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :book_id, :order_id)
  end
end

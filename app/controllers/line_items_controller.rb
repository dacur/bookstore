class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    order = current_user.cart
    quantity = params[:quantity] || 1
    LineItem.create(line_item_params.merge!(order_id: order.id, quantity: quantity))
    @line_items = order.line_items
    redirect_to "/cart"
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :book_id)
  end
end

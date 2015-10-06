class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: [:update, :destroy, :show]

  def add_to_cart
    order = current_user.cart
    quantity = params[:line_item][:quantity] || 1
    LineItem.create(line_item_params.merge!(order_id: order.id, quantity: quantity))
    @line_items = order.line_items
    redirect_to "/cart"
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to "/cart", notice: "Order successfully updated"
    end
  end

  def show
    render :edit
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :book_id)
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end

class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: [:update, :edit]

  def add_to_cart
    order = current_user.cart
    quantity = params[:line_item][:quantity]
    begin
      order.line_items.create!(line_item_params)
      @line_items = order.line_items
      redirect_to "/cart", notice: "This item was successfully added to your cart."
    rescue => e
      @line_items = order.line_items
      redirect_to "/cart", alert: "There was a problem adding this item to your cart. Please try again."
    end
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to "/cart", notice: "Order successfully updated"
    else
      redirect_to "/cart", alert: "There was a problem updating this item. Please try again."
    end
  end

  def edit
    render :edit
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :book_id)
  end

  def set_line_item
    @line_item = current_user.cart.line_items(params[:id]).first
  end
end

class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    item = LineItem.create(line_item_params)
    current_user.cart << item
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :book_id)
  end
end

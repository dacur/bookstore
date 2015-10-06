class OrderMailer < ApplicationMailer
  def send_invoice(user, order)
    @order = order
    mail(:to => user.email, :subject => "Order Confirmation: #{@order.id}")
  end
end

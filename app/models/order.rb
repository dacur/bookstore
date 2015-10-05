class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  attr_accessor :stripe_card_token

  def total_cents
    line_items.inject(0){ |sum, p| sum + p.price_cents }
  end

  def save_with_payment
    if valid?
      charge = Stripe::Charge.create(
        :amount => self.total_cents,
        :currency => "usd",
        :source => user.stripe_customer_token,
        :description => "Book order"
      )
      self.stripe_token = charge.id
      save!
      # NEED TO CHANGE ORDER.COMPLETED TO TRUE
    end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
    end
end

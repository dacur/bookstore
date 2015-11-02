class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :orders
  attr_accessor :stripe_card_token

  def cart
    orders.where(stripe_token: nil).first_or_create
  end

  def save_card
    if valid?
      customer = Stripe::Customer.create(
        :source => stripe_card_token,
        :description => "#{email}"
      )
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end

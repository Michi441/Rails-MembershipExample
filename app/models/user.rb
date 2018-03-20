class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :plan

  attr_accessor :stripe_card_token

  ## If pro user passes validation (email, password, etc. )
  ## then call Stripe and tell Stripe to set up a subscription
  ## upon charging the costumers card.
  ## Stripe responds back with customer data.
  ## Store costumer.id as the costumer token.
  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_costumer_token = customer.id
      save!
    end
  end
end

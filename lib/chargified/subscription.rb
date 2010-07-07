# http://support.chargify.com/faqs/api/api-subscriptions#api-usage-xml-subscriptions-read
module Chargify
  class Subscription
    include HappyMapper

    class << self
      def all(customer)
        subscriptions = get("/customers/#{id}/subscriptions.json")
        subscriptions.map{ |s| Subscription.new(s['subscription']) }
      end
    end

    element :id, Integer

    element :state, String

    element :balance_in_cents, Integer
    element :cancellation_message, String

    element :activated_at, DateTime
    element :expires_at, DateTime
    element :trial_started_at, DateTime
    element :trial_ended_at, DateTime
    element :current_period_started_at, DateTime
    element :current_period_ends_at, DateTime

    element :created_at, DateTime
    element :updated_at, DateTime


    has_one :customer, Customer
    has_one :credit_card, CreditCard
    has_one :product, Product

  end
end

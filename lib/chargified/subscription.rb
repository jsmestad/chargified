module Chargify
  
  class Subscription < Hashie::Dash
    property :id
    
    property :balance_in_cents
    
    property :credit_card
    property :product
    property :customer

    property :cancellation_message

    property :created_at
    property :updated_at
    
    property :activated_at
    property :expires_at
    property :trial_started_at
    property :trial_ended_at
    property :current_period_started_at
    property :current_period_ends_at

    property :state
    
    class << self
      def all(customer)
        subscriptions = get("/customers/#{id}/subscriptions.json")
        subscriptions.map{ |s| Subscription.new(s['subscription']) }
      end
    end
    
    
    
    
  end
end
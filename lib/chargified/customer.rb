module Chargify
  
  class Customer < Hashie::Dash
    property :id
    
    property :first_name
    property :last_name
    
    property :email
    property :phone
    property :organization
  
    property :address
    property :address_2
    property :city
    property :state
    property :zip
    property :country

    property :created_at
    property :updated_at
    
    property :reference
    
    class << self
      def all(options={})
        customers = get("/customers.json", :query => options)
        customers.map{ |c| Customer.new(c['customer']) }
      end

      def find_by_id(chargify_id)
        request = get("/customers/#{chargify_id}.json")
        success = request.code == 200
        response = request['customer'] if success
        Customer.new(response || {})
      end

      def find_by_reference(reference_id)
        request = get("/customers/lookup.json?reference=#{reference_id}")
        success = request.code == 200
        response = request['customer'] if success
        Customer.new(response || {})
      end

      #
      # * first_name (Required)
      # * last_name (Required)
      # * email (Required)
      # * organization (Optional) Company/Organization name
      # * reference (Optional, but encouraged) The unique identifier used within your own application for this customer
      # 
      def create(info={})
        response = post("/customers.json", :body => {:customer => info})
        return Customer.new(response['customer']) if response['customer']
        response
      end

      #
      # * first_name (Required)
      # * last_name (Required)
      # * email (Required)
      # * organization (Optional) Company/Organization name
      # * reference (Optional, but encouraged) The unique identifier used within your own application for this customer
      # 
      def update(info={})
        info.stringify_keys!
        chargify_id = info.delete('id')
        response = put("/customers/#{chargify_id}.json", :body => {:customer => info})
        return Customer.new(response['customer']) unless Customer.new(response['customer']).to_a.empty?
        response
      end

    end
    
    def update
      response = put("/customers/#{id}.json", :body => {:customer => self.to_json})
      hash = JSON.parse(response['customer']).symbolize_keys
      return self.update(hash)
      response
    end

    def subscriptions
      @subscriptions ||= Proxy.new(self, Subscription)
    end
    
  end
  
end
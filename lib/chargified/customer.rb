module Chargify
  class Customer
    include HappyMapper

    element :id, Integer
    element :reference, String

    element :first_name, String
    element :last_name, String

    element :email, String
    element :organization, String

    # element :phone, String
    # element :address, String
    # element :address_2, String
    # element :city, String
    # element :state, String
    # element :zip, String
    # element :country, String

    element :created_at, DateTime
    element :updated_at, DateTime

    # element :reference

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

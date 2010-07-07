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
        customers = parse(Client.connection["/customers"].get)
      end

      def find(id)
        customer = parse(Client.connection["/customers/#{id}"].get)
      end

      def lookup(options={})
        params = Chargified.encode_options(options)
        customers = parse(Client.connection["/customers/lookup#{params}"].get)
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

    end

    def update
      response = put("/customers/#{id}.json", :body => {:customer => self.to_json})
      hash = JSON.parse(response['customer']).symbolize_keys
      return self.update(hash)
      response
    end

  end

end

module Chargify
  
  class Product < Hashie::Dash
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
      
    end
  end
end
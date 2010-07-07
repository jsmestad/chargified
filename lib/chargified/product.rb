module Chargified
  class Product
    include HappyMapper

    element :name, String
    element :handle, String

    element :accounting_code, String
    element :description, String

    element :interval_type, Integer
    element :interval_unit, String

    element :price_in_cents, Integer

    has_one :product_family, ProductFamily

    class << self

    end
  end
end

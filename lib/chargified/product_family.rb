module Chargified
  class ProductFamily
    include HappyMapper

    element :name, String
    element :handle, String
    element :description, String
    element :accounting_code, String

  end
end

# http://support.chargify.com/faqs/api/api-charges#api-usage-xml-charges-create
module Chargify
  class Charge

    element :amount_in_cents, Integer
    element :memo, String
    element :success, Boolean

  end
end

module Chargify
  class Parser < HTTParty::Parser
    def parse
      begin
        Crack::JSON.parse(body)
      rescue => e
        raise UnexpectedResponseError, "Crack could not parse JSON. It said: #{e.message}. Chargify's raw response: #{body}"
      end
    end
  end
end
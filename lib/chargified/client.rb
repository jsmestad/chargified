module Chargified
  class Client
    class << self

      def connection(options={})
        @connection ||= RestClient::Resource.new("https://#{Chargified::Config.subdomain}.chargify.com",
          :user => Chargified::Config.api_key, :password => 'X', :content_type => 'application/xml')
      end

    end
  end
end

module ChargifiedFixtures
  class << self

    def update_customers_fixture
      connection["/customers"].get
    end

    protected

      def connection
        @connection ||= RestClient::Resource.new("https://#{Chargified::Config.subdomain}.chargify.com",
          :user => Chargified::Config.api_key, :password => 'X', :content_type => 'application/xml')
      end

  end
end

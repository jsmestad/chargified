require 'pp'

module Chargified
  module Config
    class << self

      # the configuration hash itself
      def configuration
        @configuration ||= defaults
      end

      def defaults
        {
          :logger     => defined?(RAILS_DEFAULT_LOGGER) ? RAILS_DEFAULT_LOGGER : Logger.new(STDOUT),
          :debug      => false,
          :subdomain  => "your-site-name",
          :api_key    => "your-api-key"
        }
      end

      def [](key)
        configuration[key]
      end

      def []=(key, val)
        configuration[key] = val
      end

      # remove an item from the configuration
      def delete(key)
        configuration.delete(key)
      end

      # Return the value of the key, or the default if doesn't exist
      #
      # ==== Examples
      #
      # Chargified::Config.fetch(:monkey, false)
      # => false
      #
      def fetch(key, default)
        configuration.fetch(key, default)
      end

      def to_hash
        configuration
      end

      # Yields the configuration.
      #
      # ==== Examples
      #   Chargified::Config.use do |config|
      #     config[:debug]    = true
      #     config.something  = false
      #   end
      #
      def setup
        yield self
        nil
      end

      def clear
        @configuration = {}
      end

      def reset
        @configuration = defaults
      end

      # allow getting and setting properties via Chargified::Config.xxx
      #
      # ==== Examples
      # Chargified::Config.debug
      # Chargified::Config.debug = false
      #
      def method_missing(method, *args)
        if method.to_s[-1,1] == '='
          configuration[method.to_s.tr('=','').to_sym] = *args
        else
          configuration[method]
        end
      end

    end
  end
end

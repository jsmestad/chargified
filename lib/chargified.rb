require 'cgi'
require 'rest_client'
require 'happymapper'
require 'nokogiri'

# require File.join(File.dirname(__FILE__), 'chargified', 'extensions')
# require File.join(File.dirname(__FILE__), 'chargified', 'proxy')
# require File.join(File.dirname(__FILE__), 'chargified', 'config')
# require File.join(File.dirname(__FILE__), 'chargified', 'client')
# require File.join(File.dirname(__FILE__), 'chargified', 'customer')
# require FIle.join(File.dirname(__FILE__), 'chargified', 'subscription')

module Chargified

  class UnexpectedResponseError < RuntimeError; end

  autoload :Proxy,          'chargified/proxy'
  autoload :Config,         'chargified/config'
  autoload :Client,         'chargified/client'
  autoload :Customer,       'chargified/customer'
  autoload :CreditCard,     'chargified/credit_card'
  autoload :Subscription,   'chargified/subscription'
  autoload :Product,        'chargified/product'
  autoload :ProductFamily,  'chargified/product_family'
  autoload :Charge,         'chargified/charge'

  def self.encode_options(options)
    return nil if !options.is_a?(Hash) || options.empty?

    options_string = []
    options_string << "reference=#{options.delete(:reference)}" if options[:reference]

    return "?#{options_string.join('&')}"
  end


end

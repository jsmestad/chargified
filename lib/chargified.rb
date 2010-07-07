require 'cgi'
require 'rest_client'
require 'happymapper'
require 'nokogiri'

require File.join(File.dirname(__FILE__), 'chargified', 'extensions')
require File.join(File.dirname(__FILE__), 'chargified', 'proxy')
require File.join(File.dirname(__FILE__), 'chargified', 'config')
require File.join(File.dirname(__FILE__), 'chargified', 'client')

module Chargified

  class UnexpectedResponseError < RuntimeError; end

  # autoload :Client,       'chargified/client'
  # autoload :Parser,       'chargified/parser'
  # autoload :Customer,     'chargified/customer'
  # autoload :Proxy,        'chargified/proxy'
  # autoload :Subscription, 'chargified/subscription'

end

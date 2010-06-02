require 'hashie'
require 'httparty'
require 'json'

directory = File.expand_path(File.dirname(__FILE__))

Hash.send :include, Hashie::HashExtensions

module Chargify
  VERSION = "0.2.6".freeze
  
  class UnexpectedResponseError < RuntimeError; end
  
  autoload :Client, 'chargify/client'
  autoload :Parser, 'chargify/parser'
  autoload :Customer, 'chargify/customer'
  autoload :Proxy, 'chargify/proxy'
  autoload :Subscription, 'chargify/subscription'

end
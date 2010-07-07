require 'rubygems'
require 'bundler'
require 'stale_fish'

Bundler.require(:default, :runtime, :test)
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'chargified'
require 'spec'
require 'spec/autorun'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

StaleFish.setup(File.join(File.dirname(__FILE__), 'fixtures', 'stale_fish.yml'))

Spec::Runner.configure do |config|
  # config.include(Rack::Test::Methods)

  config.before :suite do
    StaleFish.update_stale

    # Using real chargify site
    Chargified::Config.setup do |config|
      config[:api_key] = '_R5GnufAvk6yCjYRpkod'
      config[:subdomain] = 'chargified'
    end

  end

end

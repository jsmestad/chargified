require 'rake'
require 'bundler'

require 'mg'
require 'active_support/inflector'
require 'shoulda/tasks'


MG.new("chargify.gemspec")

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.ruby_opts = ['-rubygems'] if defined? Gem
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
end

task :default => :test

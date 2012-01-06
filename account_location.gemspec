# -*- encoding: utf-8 -*-

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

version = "1.0"

Gem::Specification.new do |s|
  s.name        = "account_location"
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Heinemeier Hansson"]
  s.email       = "david@37signals.com"
  s.homepage    = "http://github.com/rails/account_location"
  s.summary     = "Module that supports account-key-as-subdomain pattern"
  s.description = "Account location is a set of protected methods that supports the account-key-as-subdomain way of identifying the current scope."

  s.rubygems_version   = "1.3.7"

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec}/*`.split("\n")
  s.extra_rdoc_files = [ "README" ]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
  
  s.add_runtime_dependency "rails"
end
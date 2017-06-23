# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'solidus_admin_ebay/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_admin_ebay'
  s.version     = SolidusAdminEbay::VERSION
  s.summary     = 'Solidus Admin for Ebay Integration'
  s.description = 'Solidus Admin for Ebay Integration'
  s.license     = 'BSD-3-Clause'

  s.author    = 'mytram'
  s.email     = 'mytram2@gmail.com'
  # s.homepage  = 'http://www.example.com'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus_core', '~> 2.2.0'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end

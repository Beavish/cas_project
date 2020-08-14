source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'
# apparently
# for creating charts and graphs
gem 'chartkick'
#group date to make chartkick easiers
gem 'groupdate'

#weather API
gem 'open-weather'
#kieran test gem
#gem 'kieran_gem', '~> 10.0' #version 3  
gem 'KayShawn', '~> 14.0'
#gem 'image_magick' 
#auth 
gem 'devise'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# required for bootstrap
gem 'jquery-rails'
# Bootstap the application
gem 'bootstrap', '~> 4.0'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
#required for action text too
gem 'mini_magick'
# Use Active Storage variant
 gem 'image_processing', '~> 1.2'
 #payments
 gem 'braintree'
 #message queue 
 gem "bunny", ">= 2.14.1"



# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
      gem 'sqlite3'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
  
  group :production do
    gem 'pg'
    gem 'rails_12factor'
  end

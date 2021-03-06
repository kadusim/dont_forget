source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end
group :production do
  # Postgresql
  gem 'pg'
end

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'


# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# A gem to automate using jQuery with Rails https://github.com/rails/jquery-rails
gem 'jquery-rails'
# Build responsive, mobile-first projects on the web with the world's most popular front-end component library http://getbootstrap.com/
gem 'bootstrap', '~> 4.0.0'

# Flexible authentication solution for Rails with Warden https://github.com/plataformatec/devise
gem 'devise'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Acceptance test framework for web applications https://github.com/teamcapybara/capybara
  gem 'capybara', '~> 2.13'
  # RSpec for Rails-3+ https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '~> 3.7'
  # Webdriver for js
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver, the Chromium project's selenium webdriver adapter. https://github.com/flavorjones/chromedriver-helper
  gem 'chromedriver-helper'
end

group :test do
  # Factory Bot ♥ Rails https://github.com/thoughtbot/factory_bot_rails
  gem "factory_bot_rails"
  # A library for generating fake data such as names, addresses, and phone numbers https://github.com/stympy/faker
  gem "faker"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

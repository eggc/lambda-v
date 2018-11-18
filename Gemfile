source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.1'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'sorcery', '~> 0.12.0'
gem 'bootstrap', '~> 4.1.3'
gem 'bootstrap_form', '~> 4.0.0'
gem 'jquery-rails', '~> 4.3.3' # dependency for bootstrap in rails5.1+
gem 'turbolinks', '~> 5.2.0'

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails', '~> 0.3.7'
  gem 'rspec-rails', '~> 3.8.1'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.60.0', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

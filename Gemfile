source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails-i18n'
gem 'devise'
gem 'devise_token_auth' 
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'font-awesome-rails'
gem 'ancestry'
gem 'faker'
gem 'faker-japanese'
gem 'dotenv-rails'
gem 'rack-cors'
gem 'jquery-rails'
gem 'kaminari'
gem 'bootstrap-sass', '3.3.7'
gem 'enum_help'
gem 'data-confirm-modal'
gem 'ransack'
gem 'acts-as-taggable-on', '~> 6.0'
gem "gmaps4rails"
gem "geocoder"
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'
gem 'aws-ses'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'guard-rspec', require: false
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem "rspec_junit_formatter"
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'letter_opener_web'
  gem "email_spec"
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

group :development do
  gem 'foreman'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'launchy'
  gem 'selenium-webdriver'
end

group :production do
  gem 'unicorn', '~> 5.4.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

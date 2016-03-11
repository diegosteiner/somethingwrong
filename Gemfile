source 'https://rubygems.org'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'pg'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'factory_girl_rails', require: false
  gem 'faker', require: false
  gem 'byebug'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'bundler-audit', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
 gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'simplecov', require: false
end

group :production do
  gem 'lograge'
  gem 'puma'
  gem 'rack-timeout'
  gem 'rails_12factor'
end

source 'https://rubygems.org'
ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'


gem 'rails-api'

# Use sqlite3 as the database for Active Record
gem 'pg'
gem 'puma'
# gem 'active_model_serializers', '~> 0.10.0.rc2'
gem 'jsonapi-resources'
gem 'rack-cors', require: 'rack/cors'
gem 'responders'
gem 'mailchimp3'
gem 'sidekiq'
gem 'send_with_us'
gem "algoliasearch-rails"

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'spring'
  gem 'sinatra', :require => nil
end

group :development, :test do
  gem 'awesome_print'
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'fuubar'
  gem 'dotenv-rails'
end

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'


gem 'rails-api'

# Use sqlite3 as the database for Active Record
gem 'pg'
gem 'puma'
gem 'active_model_serializers'
gem 'rack-cors', require: 'rack/cors'
gem 'gibbon'
gem 'responders'
gem 'mailchimp3'
gem 'sidekiq'

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'spring'
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

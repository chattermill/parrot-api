ParrotApi::Application.routes.draw do
  require 'sidekiq/web'

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"
  
  namespace :api do
    resources :sessions, only: [:create], defaults: {format: :json}
    jsonapi_resources :users, only: [:create, :show, :update]
    jsonapi_resources :campaigns, only: [:create, :index, :show]
    jsonapi_resources :survey_responses, only: [:create]
  end
end

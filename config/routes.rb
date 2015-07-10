ParrotApi::Application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  namespace :api do
    resources :sessions, only: [:create], defaults: {format: :json}
    jsonapi_resources :users, only: [:create, :show, :update]
    jsonapi_resources :campaigns, only: [:create, :index, :show]
    jsonapi_resources :survey_responses, only: [:create]
  end
end

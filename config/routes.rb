ParrotApi::Application.routes.draw do
  namespace :api do
    resources :sessions, only: [:create], defaults: {format: :json}
    jsonapi_resources :users
    jsonapi_resources :campaigns
  end
end

ParrotApi::Application.routes.draw do
  namespace :api do
    resources :sessions, only: [:create], defaults: {format: :json}
    jsonapi_resources :users
    jsonapi_resources :campaigns
    jsonapi_resources :survey_responses
  end
end

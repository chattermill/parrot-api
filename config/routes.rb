ParrotApi::Application.routes.draw do
  get 'sessions/create'

  namespace :api do
    resources :sessions, only: [:create], defaults: {format: :json}
    resources :users, only: [:show], defaults: {format: :json}
  end
end

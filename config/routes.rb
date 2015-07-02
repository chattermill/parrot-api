ParrotApi::Application.routes.draw do
  get 'sessions/create'

  namespace :api do
    resources :sessions, only: [:create]
  end
end

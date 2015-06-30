ParrotApi::Application.routes.draw do
  devise_for :users
  root 'application#index'

  namespace :api do
    # resources :users
  end
end

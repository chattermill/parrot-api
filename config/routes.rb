ParrotApi::Application.routes.draw do
  root 'application#index'

  namespace :api do
    # resources :users
  end
end

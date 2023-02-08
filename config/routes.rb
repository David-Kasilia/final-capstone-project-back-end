Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :registrations, only: [:create]
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'

  devise_for :users,
             path: '', # optional namespace or empty string for no space
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               password: 'secret',
               confirmation: 'verification',
               registration: 'register',
               sign_up: 'signup'
             }

  resources :topics do end
  resources :users do end

  resources :questions do
    member do
      post "answer"
      post "update_topic"
      get "update_topic"
    end
  end

  resources :search, only: [:index]
end

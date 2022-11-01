Rails.application.routes.draw do
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  root :to => 'home#index'


  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
  
  get 'dashboard' => "dashboard#index", :as => :dashboard

  resources :user_sessions
  resources :users do
    member do
      get :activate
    end
  end

  resources :password_resets, only: [:new, :create, :edit, :update]
  
  resources :things
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

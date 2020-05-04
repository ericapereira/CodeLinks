Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :conversations do
    member do
      post :trash
    end

    resources :messages


  end
  resources :posts do
    	resources :comments
  end
  resources :controllers
  get 'scaffold/Conversations'
  resources :users, only: [:index]
  root to: "pages#home"
  get 'sessions/new'
  get 'pages/home'
  get 'pages/display'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/profile', to: 'users#profile'
  get '/lessons', to: 'pages#lessons'
  get '/thehub', to: 'pages#forum'
  get '/search', to: 'pages#search'

  get '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get 		'/login', 		to: 'sessions#new'
  post 		'/login', 	to: 'sessions#create'
  get 		'/logout', 	to: 'sessions#destroy'

  delete 		'/logout', 	to: 'sessions#destroy'
end

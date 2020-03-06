Rails.application.routes.draw do
  resources :messages
  root to: "pages#home"
  get 'sessions/new'
  get 'pages/home'
  get 'pages/display'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get 		'/login', 		to: 'sessions#new'
  post 		'/login', 	to: 'sessions#create'
  get 		'/logout', 	to: 'sessions#destroy'

  delete 		'/logout', 	to: 'sessions#destroy'
end

Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/help'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'topics/new'
  get 'sessions/new'

  resources :users
  resources :topics

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

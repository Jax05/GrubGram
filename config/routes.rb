Rails.application.routes.draw do
  resources :photos
  resources :restaurants
  resources :users, except: [:new]

  # custom route for signing up
  get '/signup', to: 'users#new'

  # custom routes for logging in/out
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

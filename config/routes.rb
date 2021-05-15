Rails.application.routes.draw do
  root 'photos#index'

  # custom route for signing up
  get '/signup', to: 'users#new'

  # custom routes for logging in/out
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  resources :users, except: [:new]
  resources :photos
  resources :restaurants do
    resources :photos, only: [:new, :create, :index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  
  resources :user_followers
  resources :ratings
  resources :date_mades
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :recipes
      resources :tags
      resources :steps
      resources :ingredients
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/current_user', to: 'auth#show'
      post '/sign_up', to: 'users#create'
    end
  end
end

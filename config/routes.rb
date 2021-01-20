Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :forecast, only: %i[index]

      resources :backgrounds, only: %i[index]

      resources :users, only: %i[create]

      resources :sessions, only: %i[create]

      resources :road_trip, only: %i[create]
      #Munchies
      get '/munchies', to: 'munchies#show'

      #Foodie
      get '/foodie', to: 'foodie#show'
    end
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :forecast, only: %i[index]

      resources :backgrounds, only: %i[index]

      resources :users, only: %i[create]

      resources :sessions, only: %i[create]
    end
  end
end

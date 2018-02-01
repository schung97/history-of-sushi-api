Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :restaurants, only: :index
      resources :categories, only: :index

      post '/auth', to: 'auth#create'
      get '/current-user', to: 'auth#show'
    end
  end
end

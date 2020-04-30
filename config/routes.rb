Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :destroy] 

  resources :daily_entries, shallow: true do
    resources :meals do
      resources :foods
    end
  end

  resources :foods
  



  root 'daily_entries#index'

end

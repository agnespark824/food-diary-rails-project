Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :destroy] do
    resources :daily_entries, only: [:index, :new, :create]
    resources :meals, only: [:index, :show]
    resources :foods, only: [:index, :show]
  end

  resources :daily_entries, only: [:show, :edit, :update, :destroy]

  resources :meals, only: [:new, :create, :edit, :update]

  resources :foods, only: [:index, :show, :new, :create, :edit, :update]

  root 'daily_entries#index'

end

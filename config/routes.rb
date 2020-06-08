Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :destroy] 

  resources :foods

  resources :entries do
    collection do
      put :update
    end
  end

  resources :entries do
    resources :entry_foods, only: [:index, :show, :new, :create]
  end

  resources :entry_foods, only: [:edit, :update, :show, :destroy]

  root 'entries#index'

end

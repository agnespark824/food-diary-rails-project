Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :destroy] 

  resources :entries do
    collection do
      put :update
    end
  end

  delete 'entry_food', to: 'entries#destroy_entry_food'

  resources :entries do
    resources :foods, only: [:index, :new, :create]
  end
  
  resources :foods

  root 'entries#index'

end

Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :destroy] 

  resources :entries do
    resources :foods, only: [:index, :new, :create]
  end
  
  resources :foods
  

  #get '/entries/:entry_id/foods', to: "foods#index"
  #get '/entries/:entry_id/foods/new', to: "foods#new", as: "new_entry_food"


  root 'entries#index'

end

Rails.application.routes.draw do
  get 'welcome/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'sessions#create'
  resources :users, only: [:new, :create, :show]

end

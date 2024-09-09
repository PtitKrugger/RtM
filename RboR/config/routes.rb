Rails.application.routes.draw do
  resources :etats
  resources :importances
  resources :taches
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

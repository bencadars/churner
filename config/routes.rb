Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"


  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :surveys, only: [:show, :new, :create, :update, :edit]
end

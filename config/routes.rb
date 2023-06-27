Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :surveys, only: [:new, :create, :show, :update, :edit]
  resources :templates do
    #resources :surveys, only: [:new, :create]
  end
end

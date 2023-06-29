Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :surveys, only: [:show, :new, :create, :update, :edit] do
    resources :users, only: [:index]
    resources :templates, only: [:index]
    member do
    post 'add_receivers'
    end
  end

end

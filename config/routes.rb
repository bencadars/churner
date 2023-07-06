Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"
  get "/dash", to: "surveys#dash"







  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :surveys, only: [:show, :new, :create, :update, :edit] do
    member do
      post :add_question
    end
    resources :users, only: [:index]
    resources :templates, only: [:index]
    resources :questions, only: [:update]
    member do
    post 'add_receivers'
    end
  end

end

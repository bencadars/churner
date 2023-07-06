Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"
  get "/dash", to: "surveys#dash"
  resources :surveys, only: [:show, :new, :create, :update, :edit, :index] do
    member do
      post :add_question
    end
    collection do
      patch :archive
    end

    resources :users, only: [:index]
    resources :templates, only: [:index]
    resources :questions, only: [:update]
    member do
    post 'add_receivers'
    end
  end
  get "/users", to: "users#all_users"

end

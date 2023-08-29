Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :purchases, only: [:index, :create]
    resources :products, only: [:new, :create, :index]
  end

  resources :products, only: [:update, :destroy, :edit, :show] do
    resources :purchases, only: [:index, :new, :create]
  end
  root to: "pages#home"
end

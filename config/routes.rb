Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"

  resources :users
  resources :prototypes, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
  end
end

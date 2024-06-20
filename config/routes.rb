Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"

  resources :prototypes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end

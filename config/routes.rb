Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :entities, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end

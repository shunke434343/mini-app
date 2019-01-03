Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy]
end

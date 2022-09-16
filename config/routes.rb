# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout'}
  mount ActionCable.server => '/cable'
  # delete  'logout'   => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'books#index'
  resources :rooms do
    resources :messages
  end

  resources :books
  resources :customers
  resources :authors
  resources :suppliers
  resources :users
  resources :rooms
end

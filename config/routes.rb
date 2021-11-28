# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"
  resources :posts, only: %i[new create show edit update index]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :admin do 
    root to: "home#index"
    resources :categories
  end
end

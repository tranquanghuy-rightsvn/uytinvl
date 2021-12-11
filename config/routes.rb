# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"
  resources :posts, only: %i[new create show edit update index]
  resources :channels do
    member do
      post :invite
      post :confirm_invite
    end
  end 
  resource :users, only: %i[edit update] do 
    collection do
      patch :change_password
    end
  end
  resources :notifications, only: :update
  resources :comments, only: %i[create update destroy]


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :admin do 
    root to: "home#index"
    resources :categories
  end

  # match '*path', :to => 'application#redirect_to_root_path', via: [:get, :post]

  mount ActionCable.server => '/cable'
end

# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"
  resources :posts, only: %i[new create show]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end

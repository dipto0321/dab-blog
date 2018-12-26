# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments, shallow: true
  end

  resources :comments do
    resources :comments, shallow: true
  end
end

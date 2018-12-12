# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users do
    resources :posts do
      resources :comments do
        resources :comments
      end
    end
  end
end

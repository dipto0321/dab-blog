# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  

  resources :users do
    resources :posts do
      resources :comments do
        resources :comments
      end
    end
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'

  resources :users do
    resources :posts do
      resources :comments do
        resources :comments
      end
    end
  end
end

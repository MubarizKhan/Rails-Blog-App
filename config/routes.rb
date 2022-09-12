# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # delete "users/sign_out", to "devise/sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#index'

  # resources :articles
  # resources :comments


  resources :articles do
    member do
      get 'archive'
    end
    resources :comments
  end

  namespace :payment do
    resources :invoices
    resources :stripes
  end

  # resource :user, only: :

  resources :users

  put "/article/:id/like", to: "likes#like"
  # resource :posts do
  #   post :archive, on: :member
  # end

  # get "/articles/index"
  # get "/articles/index", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # get "/articles/:id", to: "articles#destroy"

  # scope module: :invoice do
  #   resources :proposals, only: [:index]
  # end

  # get "/proposals/index", to: "proposals#index"
  # /home/devntech/MubarizDT/begin_rails/blog-app/blog/app/views/proposals
end

# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # do
    # resources :star, only: %i[show], module: :users
  # end
  # delete "users/sign_out", to "devise/sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#index'

  # resources :articles
  # resources :comments

  resources :articles do
    member do
      get 'archive'
    end
    resources :comments do
      # resources :star, only: %i[create destroy], module: :comments
    end
    resources :likes, only: %i[create destroy]
  end

  resources :stars

  # resources :likes,  only: [:create, :destroy]
  # resources :star, only: %i[create destroy]
  # post "/article/:id/like", to: "articles#like", as: "like"

  namespace :payment do
    resources :invoices, :stripes
  end

  # namespace :payment do
  #   resources :stripes
  # end
  # resources :stripes

  # resource :user, only: :

  resources :users

  resources :topics

  # post "topics/index", to: "topics#create"
  # post "/articles/:id/star", to: "star#create"
  # post "topics/index", to: "topics#new"

  post 'payment/invoices/new', to: 'payment/invoices#new'

  get 'payment/invoice/invest', to: 'payment/invoices#invest'
  # resources :invoices
  # new_payment_invoice_path
  # post "/payment/invoices", to: "payment/invoices#new"
  # post "/payment/invoices",to: "payment/invoices#create"
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

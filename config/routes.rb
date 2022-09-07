Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#index'

  resources :articles do
  resources :comments
  end

  # get "/articles/index", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

end

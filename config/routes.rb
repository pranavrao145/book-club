# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  scope 'books', controller: :book do
    scope '/:book_id' do
      resources :review
      get 'view'
    end
    get '/all', to: 'book#index'
    get '', to: 'book#index'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

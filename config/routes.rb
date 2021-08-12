# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  get 'reviews', to: 'review#my_reviews'
  get 'reviews/all', to: 'review#my_reviews'

  scope 'books', controller: :book do
    scope '/:book_id' do
      resources :review
      get 'view'
    end

    get 'search'
    get '/:book_id', to: 'book#view'
  end

  get 'search_books', to: 'book#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

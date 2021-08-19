# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#decide'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'my_reviews', to: 'review#my_reviews'

  scope 'books', controller: :book do
    scope '/:book_id' do
      resources :reviews, controller: :review, param: :review_id
      resources :discussions, controller: :discussion, param: :discussion_id do
        resources :replies, controller: :reply, param: :reply_id, except: %i[index create update]
      end
      get 'view'
    end

    get 'search'
    get '/:book_id', to: 'book#view'
  end

  get 'search_books', to: 'book#search'
  get 'home', to: 'pages#home'

  resource :replies, controller: :reply, only: %i[create], path: '/books/:book_id/discussions/:discussion_discussion_id/replies',
                     as: 'replies'
  resource :replies, controller: :reply, only: %i[update], path: '/books/:book_id/discussions/:discussion_discussion_id/replies/:reply_id',
                     as: 'reply'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

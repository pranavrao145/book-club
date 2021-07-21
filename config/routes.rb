Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  scope '/books/:id', controller: :books do
    resources :review
    get 'view'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

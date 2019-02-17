Rails.application.routes.draw do
  root "static_pages#home"
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  get    '/logout', to: 'sessions#destroy'
  resources :users, param: :user_id
  resources :items, param: :item_id
end

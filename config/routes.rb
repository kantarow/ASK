Rails.application.routes.draw do
  get 'items/new'
  get 'items/create'
  get 'items/edit'
  get 'items/update'
  get 'items/destroy'
  get 'new/create'
  get 'new/edit'
  get 'new/update'
  get 'new/destroy'
  get ':id/items', to: 'users#items'
  root "static_pages#home"
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  get    '/logout', to: 'sessions#destroy'
  resources :users, param: :user_id, path: '/'
  resources :items, param: :item_id, path: '/:user_id/:item_id'
end

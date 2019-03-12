Rails.application.routes.draw do
  root "static_pages#home"
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  get    '/logout', to: 'sessions#destroy'
  get    '/search', to: 'search#search'
  get    '/changetab', to: 'static_pages#change_tab'

  resources :users, param: :user_id do
    member do
      get 'follow'
    end
  end

  resources :items, param: :item_id do
    member do
      get 'like'
    end
  end
end

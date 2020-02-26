Rails.application.routes.draw do
  devise_for :users
  root to:'toppage#index'
  
  resources :users, only: [:show, :index]
  resources :cards, only: [:new, :show, :index, :edit] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
      post 'buy/:id', to: 'cards#buy'
    end
  end
  resources :toppage, only: :index

  resources :products, only: [:new, :create, :show]
  resources :categories, only: [:show, :index]
end






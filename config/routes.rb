Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
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

  resources :products do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :categories, only: [:show, :index]
  resources :addresses, only: [:new, :create, :edit, :update] do
    collection do
      get 'mypage_new', to: 'addresses#mypage_new'
      post 'mypage_create', to: 'addresses#mypage_create'
    end
  end

end






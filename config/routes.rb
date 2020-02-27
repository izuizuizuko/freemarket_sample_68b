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

  resources :products, only: [:new, :create, :show]
  resources :categories, only: [:show, :index]
  resources :addresses, only: [:new, :create, :edit, :update] do
    collection do
      get 'new2', to: 'addresses#new2'
      post 'create2', to: 'addresses#create2'
    end
  end

end






Rails.application.routes.draw do
  get 'group_users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about",as: 'about'
  get 'search' => 'searches#search'

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update]do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get "search", to: "users#search"
  end

  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  resources :chats, only: [:show, :create]
  resources :groups, except: [:destroy] do
    resource :group_users, only: [:create, :destroy]
  end
  resources :group_users, only: [:edit, :update]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
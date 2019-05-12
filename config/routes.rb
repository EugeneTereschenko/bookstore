Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :carts

  match '/add_item', to: 'carts#add_item', via: 'get'
  match '/coupon', to: 'carts#coupon', via: 'get'
  match '/checkout', to: 'carts#checkout', via: 'get'
  match '/addresses', to: 'addresses#show', via: 'get'
  match '/addresses', to: 'addresses#save', via: 'post'

  resources :reviews
  resources :categories
  resources :addresses
  resources :books
  resources :orders
  resources :checkout_steps

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home'
  get 'home/home'

end

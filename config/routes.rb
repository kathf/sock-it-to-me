Rails.application.routes.draw do

  devise_for :users

  root 'socks#homepage', as: '/'

  resources :socks do
    get 'homepage', on: :member
  end

  resources :orders, only: [:create, :show]
end

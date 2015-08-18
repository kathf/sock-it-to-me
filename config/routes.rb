Rails.application.routes.draw do

  devise_for :users

  root 'socks#homepage', as: '/'

  resources :socks do
    get 'homepage', on: :member
    get 'work_in_progress', on: :member
  end

  resources :orders
end

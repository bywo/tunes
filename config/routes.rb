Tunes::Application.routes.draw do

  devise_for :users
  # TEMP
  root 'static_pages#home'
  # PEMT

  resources :songs
  resources :sounds
  resources :keys
  resources :groups
  resources :memberships
  resources :users

  # if Rails.env.production?
  #   root 'webapp#index'
  # end

  # namespace :api do
  #   resources :songs
  #   resources :sounds
  #   resources :keys
  # end

  # if Rails.env.production?
  #   get '*path' => 'webapp#index'
  # end

end

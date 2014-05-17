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

end

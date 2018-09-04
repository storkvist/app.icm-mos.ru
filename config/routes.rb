Rails.application.routes.draw do
  devise_for :users

  resources :kits, except: :show
  resources :scales, only: :index
  resources :users

  get '/home', to: 'static#authorized_home'

  root to: 'kits#index'
end

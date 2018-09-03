Rails.application.routes.draw do
  devise_for :users

  resources :kits, except: :show
  resources :scales, only: :index

  root to: 'kits#index'
end

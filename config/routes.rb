Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: %i[index]
  resources :kits, only: %i[index]
  resources :scales, only: %i[index]

  root to: 'kits#index'
end

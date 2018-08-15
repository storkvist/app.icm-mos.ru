Rails.application.routes.draw do
  devise_for :users

  resources :kits, except: :show

  root to: 'kits#index'
end

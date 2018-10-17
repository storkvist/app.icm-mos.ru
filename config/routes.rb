Rails.application.routes.draw do
  devise_for :users

  resources :exports, only: %i[index show create]
  resources :kits
  resources :scales, only: :index
  resources :users

  get '/home', to: 'static#authorized_home'

  require 'sidekiq/web'
  authenticate :user, ->(user) { user.manage_all? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'kits#index'
end

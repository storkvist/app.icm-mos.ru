Rails.application.routes.draw do
  devise_for :users

  resources :kits, except: :show do
    get :images, on: :member
  end

  root to: 'kits#index'
end

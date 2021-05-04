Rails.application.routes.draw do
  devise_for :users
  root to: 'staffs#index'
  resources :staffs, only: [:index]
end

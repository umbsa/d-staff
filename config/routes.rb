Rails.application.routes.draw do
  get 'reservations/index'
  devise_for :users
  root to: 'staffs#index'
  resources :staffs, only: [:index, :new, :create, :show] do
    resources :reservations, only: [:index, :new, :create]
  end
end

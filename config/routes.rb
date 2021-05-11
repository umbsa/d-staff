Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  get 'reservations/index'
  devise_for :users
  root to: 'staffs#index'
  resources :staffs, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
    resources :reservations, only: [:index, :new, :create, :edit]
  end
  resources :verifications, only: :index

  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
end

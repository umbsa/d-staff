Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  get 'reservations/index'
  devise_for :users
  root to: 'staffs#index'
  resources :staffs, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    post 'order', on: :member
    get 'credit', on: :member
    resources :reservations, only: [:index, :new, :create, :edit] do
      get 'address', on: :collection
    end
  end
  resources :verifications, only: [:index]

  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
end

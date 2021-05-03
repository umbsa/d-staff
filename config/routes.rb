Rails.application.routes.draw do
  root to: 'staffs#index'
  resources :staffs, only: [:index]
end

Rails.application.routes.draw do
  root to: 'homes#index'
  resources :users, only: [:index, :new, :create]
end

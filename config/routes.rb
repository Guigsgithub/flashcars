Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :cars do
      resources :rentals, only: [:new, :create]
      resources :reviews, only: [ :new, :create ]
    end
    resources :rentals, only: [:index, :show, :destroy]
    resources :reviews, only: [ :destroy ]
    resources :users
end

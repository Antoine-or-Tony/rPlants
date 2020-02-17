Rails.application.routes.draw do
  root to: 'pages#home'
  resources :plants
  resources :users
  resources :bookings
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

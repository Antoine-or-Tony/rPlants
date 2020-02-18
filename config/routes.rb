Rails.application.routes.draw do
  root to: 'pages#home'
  resources :plants
  resources :users
  resources :bookings do
    resources :reviews, only: [ :index, :show, :new, :create ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

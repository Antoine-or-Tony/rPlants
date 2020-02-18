Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :plants do
    resources :bookings do
      resources :reviews, only: [ :index, :show, :new, :create ]
    end
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users, 
    controllers: { registrations: 'users/registrations' }
  root to: "posts#index"
  resources :users, only: :show
  resources :posts, only: [:index, :new]
end

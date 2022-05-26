Rails.application.routes.draw do
  devise_for :users, 
    controllers: { registrations: 'users/registrations' }
  root to: "posts#index"
  resources :users, only: :show
  resources :posts do
    resources :comments, only: :create
    resource :likes, only: [:create, :destroy]
  end
end

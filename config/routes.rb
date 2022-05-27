Rails.application.routes.draw do
  devise_for :users, 
    controllers: { registrations: 'users/registrations' }
  root to: "posts#index"
  resources :users, only: [:index, :show]
  get "users/:id/likes" => "users#likes"
  resources :posts do
    resources :comments, only: :create
    resource :likes, only: [:create, :destroy]
    collection do
      get :search
    end
  end
  resources :relationships, only: [:create, :destroy]
end

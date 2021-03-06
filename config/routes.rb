Rails.application.routes.draw do
  
  root 'posts#index'
  
  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
    
  resources :users, only: [:index, :show, :destroy] do
    get :search, on: :collection
    
    member do
      get :following, :followers
    end
    
  end
  
  resources   :posts,     only: [:index, :show, :create, :destroy] do
    resources :photos,    only: [:create]
    resources :likes,     only: [:create, :destroy],         shallow: true
    resources :bookmarks, only: [:create, :destroy],         shallow: true
    resources :comments,  only: [:index, :create, :destroy], shallow: true
  end
  
  resources :relationships, only: [:create, :destroy]
  
end

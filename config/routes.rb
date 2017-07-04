Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'login',
                                             sign_out: 'logout', edit: 'edit'},
                     controllers: { omniauth_callbacks:  'users/omniauth_callbacks',
                                    registrations: 'users/registrations' }

  authenticated :user do
    root 'users#home', as: :authenticated_root
  end

  unauthenticated :user do
    root to: redirect('/signup')
  end

  resources :users, path: '', param: :username, only: :show do
    resources :posts, path: 'p', only: [:show, :create, :destroy] do
      resources :likes, only: [:create, :destroy]
      resources :images, only: :create
      resources :comments, only: [:create, :destroy] do
        resources :likes, only: [:create, :destroy]
      end
    end
    member do
      get :following, :followers
    end
  end
  patch '/edit', to: 'profiles#update', as: :profile
  resources :relationships, only: [ :create, :destroy ]
  get '/explore/tags/:body', to: 'posts#tags', as: :tag
end

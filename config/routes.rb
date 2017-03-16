Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' },
    :controllers => { omniauth_callbacks:  'users/omniauth_callbacks' }
  devise_scope :user do
    authenticated :user do
      root 'users#home', as: :authenticated_root
    end

    unauthenticated :user do
      root 'devise/registrations#new', as: :non_authenticated_root
    end
  end
  resources :users, param: :username, path: '', except: [ :create, :new ] do
    resources :avatars, only: [ :create, :destroy, :update ], path: '/a'
    resources :posts, only: [ :show, :create, :destroy ] do
      resources :images, only: [ :create, :destroy ]
      resources :comments, only: [ :create, :destroy ]
    end
    get 'users', on: :collection, action: :index, as: ''
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [ :create, :destroy ]
  get '/posts/tags/:name', to: 'posts#tags', as: :tag
end

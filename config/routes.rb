Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'login',
                                             sign_out: 'logout', edit: ':username/edit'},
                     controllers: { omniauth_callbacks:  'users/omniauth_callbacks' }

  devise_scope :user do
    authenticated :user do
      root 'users#home', as: :authenticated_root
    end

    unauthenticated :user do
      root 'devise/registrations#new', as: :non_authenticated_root
    end
  end

  get '/', to: 'users#index', as: :users
  resources :users, path: '', param: :username, only: [:show] do
    resources :posts, path: 'p', only: [ :show, :create, :destroy ] do
      resources :images, only: :create
      resources :comments, only: [ :create, :destroy ]
    end
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [ :create, :destroy ]
  get '/posts/tags/:name', to: 'posts#tags', as: :tag
end

Rails.application.routes.draw do
  root 'static_pages#home'
  #devise_for :users, path: '', path_names: { sign_in: '', sign_out: 'signout'}
  devise_for :users
  resources :users, param: :username, path: '', except: [ :index, :create, :new ] do
    resources :avatars, only: [ :create, :destroy ]
    resources :posts, only: [ :create, :destroy ] do
      resources :images, only: [ :create, :destroy ]
      resources :comments, only: [ :create, :destroy ]
    end
    get 'users', on: :collection, action: :index, as: ''
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [ :create, :destroy ]
  get '/posts/explore/tags/:name', to: 'posts#tags', as: :tag
end

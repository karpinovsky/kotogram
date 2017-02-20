Rails.application.routes.draw do
  root 'static_pages#home'
  #devise_for :users, path: '', path_names: { sign_in: '', sign_out: 'signout'}
  devise_for :users
  resources :users, param: :username, path: '', except: [ :index, :create, :new ] do
    resources :images, only: [ :create, :destroy ] do
      resources :comments, module: :images
    end
    get 'users', on: :collection, action: :index, as: ''
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [ :create, :destroy ]
end

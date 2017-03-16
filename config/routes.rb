Rails.application.routes.draw do
  root 'static_pages#home'
  #devise_for :users, path: '', path_names: { sign_in: '', sign_out: 'signout'}
  devise_for :users, :controllers => { omniauth_callbacks:  'users/omniauth_callbacks',
                                       confirmations: 'confirmations'}
  resources :users, param: :username, path: '', except: [ :index, :create, :new ] do
    resources :avatars, only: [ :create, :destroy, :update ], path: '/a'
    resources :posts, only: [ :show, :create, :destroy ], path: '/p' do
      resources :images, only: [ :create, :destroy ]
      resources :comments, only: [ :create, :destroy ]
    end
    get 'users', on: :collection, action: :index, as: ''
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [ :create, :destroy ]
  get '/p/explore/tags/:name', to: 'posts#tags', as: :tag
end

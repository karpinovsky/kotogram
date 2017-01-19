Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
    authenticated :user do
      root to: 'users#feed'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  resources :users, param: :login, only: :index
  resources :users, param: :login, path: '', except: :index
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'pages#index'

  namespace :admin do
    get '/' => 'dashboard#index'
    get 'clubs' => 'clubs#index'
    get 'config' => 'config#index'
    resources :patch_types
    # resources :items
    # resources :clubs
    # resources :configs

    resources :orders, only: [:show]
  end
end

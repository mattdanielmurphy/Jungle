Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: %i[index show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end

  resources :orders, only: %i[create show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: %i[edit update show]

    resources :categories
  end

  # these routes are for showing users a login form, logging them in, and logging them out.
  resource :sessions, path: '/login' do
    get :new
    post :create
  end

  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end

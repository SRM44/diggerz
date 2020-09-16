Rails.application.routes.draw do

  get 'connexion', to: 'new_app_design#session'
  get 'inscription', to: 'new_app_design#registration'
  get 'localisation', to: 'new_app_design#localisation'
  get 'home', to: 'new_app_design#home'
  get 'deals', to: 'new_app_design#deals_page'

  get 'myrecords/index'
  root to: 'pages#home'

  devise_for :users, controllers: {
    registrations:      'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :mydeals, only: [:index, :show]

  resources :deals, only: [:index, :show] do
    member do
      patch :confirm
      patch :accept
      patch :decline
    end
  end

  resources :records, only: [:index, :show] do
    resources :deals, only: [:new, :create]
  end

  resources :myrecords, only: [:index, :show, :new, :create, :update] do
    collection do
      get :import_from_discogs
    end
    member do
      patch :toggle_swappable
    end
  end

  resource :profile, only: [:show, :edit, :update] do
   resource :preferences, only: [:edit, :update]
  end
end

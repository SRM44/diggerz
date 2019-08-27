Rails.application.routes.draw do

  get 'myrecords/index'
  root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

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

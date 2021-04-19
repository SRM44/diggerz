Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#home'

  devise_for :users, controllers: {
    registrations:      'users/registrations',
    sessions:           'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations:      'users/confirmations'
  }

  resources :mydeals, only: [:show] do
    collection do
      get "received",    to: 'mydeals/received#index'
      get "requested",   to: 'mydeals/requested#index'
      get "in_progress", to: 'mydeals/in_progress#index'
      get "completed",   to: 'mydeals/completed#index'
    end
  end

  resources :deals, only: [] do
    member do
      # Deal lifecycle
      ## Phase 1: deal open
      patch :accept
      patch :decline
      patch :cancel

      ## Phase 2: deal in progress
      patch :confirm
    end
  end

  resources :records, only: [:index, :show] do
    collection do
      get 'discover'
    end
    resources :deals, only: [:new, :create]
  end

  resources :myrecords, only: [:index, :show, :new, :create, :destroy] do
    resources :releases, only: [:edit, :update]

    collection do
      resources :releases, only: [:new, :create]

      get :import_from_discogs
    end

    member do
      patch :toggle_swappable
    end
  end

  resource :profile, only: [:show, :edit, :update] do
    resource :preferences, only: [:edit, :update]
  end

  resource :account, only: [] do
    resource :location, only: [:edit, :update], controller: 'account/location'
  end
end

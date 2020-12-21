Rails.application.routes.draw do
  get 'deals',                        to: 'new_app_design#deals_page'
  get 'deal-envoye',                  to: 'new_app_design#show_deal_sent'
  get 'deal-recu',                    to: 'new_app_design#show_deal_pending'
  get 'deal-valide',                  to: 'new_app_design#show_deal_validated'
  get 'deal-valide-une-confirmation', to: 'new_app_design#show_deal_validated_one_confirmation'
  get 'deal-termine',                 to: 'new_app_design#show_deal_over'
  get 'deal-annule',                  to: 'new_app_design#show_deal_cancelled'
  get 'forgot',                       to: 'new_app_design#forgot_password'

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

      ## Phase 3: specific show when deal has been completed
      get :completed
    end
  end

  resources :records, only: [:index, :show] do
    collection do
      get 'discover'
    end
    resources :deals, only: [:new, :create]
  end

  resources :myrecords, only: [:index, :show, :new, :create, :update, :destroy] do
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

Rails.application.routes.draw do

  get 'connexion', to: 'new_app_design#session'
  get 'inscription', to: 'new_app_design#registration'
  get 'localisation', to: 'new_app_design#localisation'
  get 'home', to: 'new_app_design#home'
  get 'deals', to: 'new_app_design#deals_page'
  get 'deal-envoye', to: 'new_app_design#show_deal_sent'
  get 'deal-recu', to: 'new_app_design#show_deal_pending'
  get 'deal-valide', to: 'new_app_design#show_deal_validated'
  get 'deal-valide-une-confirmation', to: 'new_app_design#show_deal_validated_one_confirmation'
  get 'deal-termine', to: 'new_app_design#show_deal_over'
  get 'deal-annule', to: 'new_app_design#show_deal_cancelled'
  get 'forgot', to: 'new_app_design#forgot_password'
  get 'discotheque', to: 'new_app_design#discotheque'

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

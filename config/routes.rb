Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

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

  resources :myrecords, only: [:index, :show, :new, :create] do
    member do
      patch :toggle_swappable
    end
  end

  resource :profile, only: [:edit, :update]

end

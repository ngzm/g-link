Rails.application.routes.draw do
  # Api of ajax from client apps
  namespace :api do
    # Api main
    get 'main/index', format: false

    # Api access to games resources
    resources :games, only: %i[index show], format: false do
      # Api access to reviews resources
      resource :reviews, only: %i[show update create], format: false
    end
    # Api access to games searched by category id
    get 'games/search/:category_id', to: 'games#search', format: false

    # Api for user authentication
    get 'users/auth/exchange', to: 'users#exchange_auth_token', format: false
    get 'users/auth', format: false

    # Api for ranking of games
    get 'ranking', to: 'ranking#index', format: false

    # Api for advertises for client
    get 'advertises', to: 'advertises#index', format: false
    get 'advertises/search', format: false
  end

  # User autentication using Other OP Services,
  # with using OpenID Connect or Oath2 protocols
  namespace :rp do
    get 'main/index'
    get 'google/show'
    get 'google/create'
    get 'facebook/show'
    get 'facebook/create'
  end

  # Admin
  namespace :admin do
    get 'admin/main', format: false
    get 'admin/login', format: false
    get 'admin/logout', format: false
    resources :games, format: false do
      resource :instructions, only: %i[edit create], format: false
    end
    resources :advertises, format: false
  end

  # Api for g-link client using ajax
  get 'cview', to: 'api/main#index', format: false
  match 'cview/*other', to: 'api/main#index', via: :all, format: false

  # Root
  root to: redirect('/cview')
end

Rails.application.routes.draw do
  # Api of ajax from client apps
  namespace :api do
    # Api main
    get 'main/index', format: false

    # Api access to games resources
    # Api access to reviews of a game
    get 'games/search/:category_id', to: 'games#search', format: false
    resources :games, only: %i[index show], format: false do
      resource :reviews, only: %i[show update create], format: false
    end

    # Api for user authentication
    get 'users/auth/exchange', to: 'users#exchange_auth_token', format: false
    get 'users/auth', format: false
  end

  # User autentication using Other OP Services,
  # with using OpenID Connect or Oath2 protocols
  namespace :rp do
    get 'main/index'
    get 'google/show'
    get 'google/create'
  end

  # Api for g-link client using ajax
  match 'game/*other', to: 'api/main#index', via: :all

  # Root
  root 'api/main#index'
end

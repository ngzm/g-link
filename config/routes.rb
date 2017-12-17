Rails.application.routes.draw do
  namespace :api do
    get 'main/index', format: false
    get 'games/search/:category_id', to: 'games#search', format: false
    resources :games, only: %i[index show], format: false
  end

  root 'api/main#index'
end

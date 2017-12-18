Rails.application.routes.draw do
  namespace :api do
    get 'main/index', format: false
    get 'games/search/:category_id', to: 'games#search', format: false
    resources :games, only: %i[index show], format: false do
      resource :reviews, only: %i[show update create], format: false
    end
  end
  root 'api/main#index'
end

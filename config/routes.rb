Rails.application.routes.draw do
  namespace :api do
    get 'main/index', format: false
    get 'games/:category_id', to: 'games#index', format: false
    get 'games/show/:game_id', to: 'games#show', format: false
  end

  root 'api/main#index'
end

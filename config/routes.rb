Rails.application.routes.draw do
  get 'api/game_list/:category_id', to: 'game_list#index', as: :game_list
  get 'main/index'
  root 'main#index'
end

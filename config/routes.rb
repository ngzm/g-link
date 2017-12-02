Rails.application.routes.draw do
  get 'api/game_list/:category_id', to: 'game_list#index', as: :game_list
  get 'api/game_detail/:game_id', to: 'game_list#detail', as: :game_detail
  get 'api/game_review/:game_id', to: 'game_list#review', as: :game_review
  post 'api/game_review/:game_id', to: 'game_list#rcreate'
  patch 'api/game_review/:game_id', to: 'game_list#rupdate'
  get 'main/index'
  root 'main#index'
end

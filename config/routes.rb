Rails.application.routes.draw do
  resources :game_links
  get 'main/index'
  root 'main#index'
end

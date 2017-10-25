json.extract! game_link, :id, :title, :description, :url, :img, :category1, :category2, :category3, :access, :star, :created_at, :updated_at
json.url game_link_url(game_link, format: :json)

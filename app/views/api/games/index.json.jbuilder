json.array!(@games) do |game|
  json.extract! game, \
                :id, :title, :description, :url, \
                :category1, :category2, :category3, :gtype, \
                :access, :star, :created_at, :updated_at
  json.img(game.img.url)
end

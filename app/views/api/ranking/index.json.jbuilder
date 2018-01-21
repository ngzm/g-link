json.updates do
  json.array!(@updates) do |game|
    json.extract! game, \
                  :id, :title, :description, :url, \
                  :category1, :category2, :category3, \
                  :access, :star, :created_at, :updated_at
    json.img(game.img.url)
  end
end
json.stars do
  json.array!(@stars) do |game|
    json.extract! game, \
                  :id, :title, :description, :url, \
                  :category1, :category2, :category3, \
                  :access, :star, :created_at, :updated_at
    json.img(game.img.url)
  end
end
json.accesses do
  json.array!(@accesses) do |game|
    json.extract! game, \
                  :id, :title, :description, :url, \
                  :category1, :category2, :category3, \
                  :access, :star, :created_at, :updated_at
    json.img(game.img.url)
  end
end

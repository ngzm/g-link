json.array!(@games) do |game|
  json.extract! game, \
                :id, :title, :description, :url, :img, \
                :category1, :category2, :category3, \
                :access, :star, :created_at, :updated_at
end

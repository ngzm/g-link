json.array!(@games) do |game|
  json.extract! game, :id, :title, :description,  \
    :url, :img, :category1, :category2, :category3, :access, \
    :star, :created_at, :updated_at
  json.instructions do
    json.array!(game.instructions) do |instruction|
      json.inst(instruction.inst)
    end
  end
end

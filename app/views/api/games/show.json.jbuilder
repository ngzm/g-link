json.extract! @game,   \
              :id, :title, :description, :url, \
              :category1, :category2, :category3, :gtype, \
              :access, :star, :created_at, :updated_at
json.img(@game.img.url)

json.instructions do
  json.array!(@instructions) do |instruct|
    json.explanation(instruct.explanation)
  end
end

json.reviews do
  json.array!(@reviews) do |review|
    json.star(review.star)
    json.comment(review.comment)
    json.user(review.user.name)
  end
end

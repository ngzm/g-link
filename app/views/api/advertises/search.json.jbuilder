json.array!(@advertises) do |ad|
  json.extract! ad, \
                :id, :title, :description, :src, :adtype, \
                :priority, :show, :created_at, :updated_at
end

json.array!(@reviews) do |review|
  json.extract! review, :id, :comment, :product_id
  json.url review_url(review, format: :json)
end

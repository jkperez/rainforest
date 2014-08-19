json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price_in_cents
  json.url product_url(product, format: :json)
end

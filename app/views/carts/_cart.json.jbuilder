json.extract! cart, :id, :order_total_price, :precision, :scale, :created_at, :updated_at
json.url cart_url(cart, format: :json)

json.extract! address, :id, :address_type, :first_name, :last_name, :address, :city, :zip, :country, :phone, :created_at, :updated_at
json.url address_url(address, format: :json)

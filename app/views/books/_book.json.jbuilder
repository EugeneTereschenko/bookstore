json.extract! book, :id, :title, :description, :image, :materials, :price, :height, :width, :depth, :year, :in_stock, :author, :created_at, :updated_at
json.url book_url(book, format: :json)

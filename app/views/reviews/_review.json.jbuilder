json.extract! review, :id, :score, :reviewer_name, :body, :state, :book_id, :user_id, :created_at, :updated_at
json.url review_url(review, format: :json)

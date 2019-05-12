class Book < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :items, dependent: :nullify
  has_many :order_items, dependent: :nullify
end

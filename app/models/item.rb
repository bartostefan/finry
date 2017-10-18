class Item < ApplicationRecord
  belongs_to :category

  validates :title, :price, :category_id, presence: true
  validates :price, numericality: true
end

# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :items, dependent: :delete_all

  validates :title, presence: true
end

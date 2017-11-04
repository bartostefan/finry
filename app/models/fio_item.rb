# frozen_string_literal: true

class FioItem < ApplicationRecord
  scope :active, -> { where(deleted_at: nil) }

  validates :transaction_id, :amount, :date, presence: true
end

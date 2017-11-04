# frozen_string_literal: true

class Token < ApplicationRecord
  validates :title, :token, presence: true
end

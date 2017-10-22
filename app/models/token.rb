class Token < ApplicationRecord
  validates :title, :token, presence: true
end

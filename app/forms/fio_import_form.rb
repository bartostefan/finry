# frozen_string_literal: true

class FioImportForm < BaseForm
  attr_accessor :date_from, :date_to, :token_id

  validates :date_from, :date_to, :token_id, presence: true

  def initialize(params = {})
    @params = params
    @date_from = params[:date_from]
    @date_to = params[:date_to]
    @token_id = params[:token_id]
  end

  def save
    return unless valid?
    begin
      Fio::Transactions.call(@params)
    rescue StandardError => e
      errors.add(:base, "Error: #{e}")
    end
  end
end

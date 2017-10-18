class FioImportForm < BaseForm
  attr_accessor :date_from, :date_to

  validates :date_from, :date_to, presence: true

  def initialize(params = {})
    @params = params
    @date_from = params[:date_from]
    @date_to = params[:date_to]
  end

  def save
    if valid?
      begin
        Fio::Transactions.call(@params)
      rescue Exception => e
        errors.add(:base, "Error: #{e}")
      end
    end
  end
end

module Fio
  class Transactions
    include Service

    def initialize(params)
      @date_from = params[:date_from]
      @date_to = params[:date_to]
    end

    def call
      save!
    end

    private

    def save!
      list.by_date_range(change_to_date(@date_from), change_to_date(@date_to))

      list.response.transactions.each do |transaction|
        next if transaction.amount > 0
        Fio::CreateFioItemFromTransaction.call(transaction)
      end

      list.response.transactions
    end

    def list
      @list ||= FioAPI::List.new
    end

    def change_to_date(date)
      Date.strptime(date)
    end
  end
end

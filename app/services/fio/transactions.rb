module Fio
  class Transactions
    include Service

    def initialize(params)
      @date_from = params[:date_from]
      @date_to = params[:date_to]
      @token_id = params[:token_id].to_i
    end

    def call
      save!
    end

    private

    def save!
      transactions = []

      tokens.each do |token|
        FioAPI.token = token.token
        list.by_date_range(change_to_date(@date_from), change_to_date(@date_to))

        list.response.transactions.each do |transaction|
          next if transaction.amount > 0
          Fio::CreateFioItemFromTransaction.call(transaction)
        end

        transactions << list.response.transactions
      end

      transactions.flatten
    end

    def list
      @list ||= FioAPI::List.new
    end

    def change_to_date(date)
      Date.strptime(date)
    end

    def tokens
      @tokens ||= @token_id.positive? ? Token.where(id: @token_id) : Token.all
    end
  end
end

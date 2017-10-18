module Fio
  class CreateFioItemFromTransaction
    include Service

    def initialize(transaction)
      @transaction = transaction
    end

    def call
      save!
    end

    private

    def save!
      FioItem.create!({
        transaction_id: @transaction.transaction_id,
        amount: @transaction.amount,
        date: @transaction.date,
        comment: @transaction.comment.to_s.split(',')[0]
      }) unless FioItem.exists?(transaction_id: @transaction.transaction_id)
    end
  end
end
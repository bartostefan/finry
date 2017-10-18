require 'test_helper'

module Fio
  class CreateFioItemFromTransactionTest < ActiveSupport::TestCase
    setup do
      @transaction = fio_items(:one)
    end

    test 'save transaction which does not exists' do
      new_transaction = @transaction.dup
      new_transaction.transaction_id = 100

      assert_difference('FioItem.count') do
        Fio::CreateFioItemFromTransaction.call(new_transaction)
      end
    end

    test 'can not save transaction which exist' do
      assert_difference('FioItem.count', 0) do
        Fio::CreateFioItemFromTransaction.call(@transaction)
      end
    end
  end
end

require 'test_helper'

module Fio
  class IdentifyItemTest < ActiveSupport::TestCase
    test 'identify as new Item object' do
      result = Fio::IdentifyItem.call('')
      assert_instance_of Item, result
    end

    test 'identify as predefined Item object with FioItem' do
      fio_item = fio_items(:two)
      result = Fio::IdentifyItem.call(fio_item.id)
      assert_instance_of Item, result
      assert_equal(fio_item.amount, result.price)
      assert_equal(fio_item.date, result.buy_at)
      assert_not_empty result.title
      assert_not_empty result.description
    end
  end
end

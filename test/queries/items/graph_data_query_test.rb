# frozen_string_literal: true

require 'test_helper'

module Items
  class GraphDataQueryTest < ActiveSupport::TestCase
    test 'right results from fixtures for graph' do
      result = Items::GraphDataQuery.call
      assert_not_empty(result)
      assert_equal(result[%w[Dum 11-2017]], 0.9876e4)
      assert_equal(result[%w[Nakupy 11-2017]], 0.3492e4)
    end
  end
end

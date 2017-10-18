require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
    @fio_item
  end

  test 'should get index' do
    get items_url
    assert_response :success
  end

  test 'should get new' do
    get new_item_url
    assert_response :success
  end

  test 'should create item' do
    assert_difference('Item.count') do
      post items_url, params: { item: { description: 'item description', price: 1200, title: 'item title', category_id: @item.category.id, buy_at: '11/12/2017' } }
    end

    item = Item.last
    assert_equal('item description', item.description)
    assert_equal(1200, item.price)
    assert_equal('item title', item.title)
    assert_equal(@item.category.id, item.category.id)
    assert_equal('11/12/2017'.to_datetime, item.buy_at)
    assert_redirected_to item_url(item)
  end

  test 'should create item with fio_item_id' do
    fio_item_id = fio_items(:one).id

    assert_difference('Item.count') do
      post items_url, params: { fio_item_id: fio_item_id, item: { description: 'item description', price: 1200, title: 'item title', category_id: @item.category.id, buy_at: '11/12/2017' } }
    end

    item = Item.last
    assert_equal('item description', item.description)
    assert_equal(1200, item.price)
    assert_equal('item title', item.title)
    assert_equal(@item.category.id, item.category.id)
    assert_equal('11/12/2017'.to_datetime, item.buy_at)
    assert_redirected_to fio_items_url
  end

  test 'should show item' do
    get item_url(@item)
    assert_response :success
  end

  test 'should get edit' do
    get edit_item_url(@item)
    assert_response :success
  end

  test 'should update item' do
    patch item_url(@item), params: { item: { description: @item.description, price: @item.price, title: @item.title } }
    assert_redirected_to item_url(@item)
  end

  test 'should destroy item' do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end

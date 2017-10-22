require 'test_helper'

class FioItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fio_item = fio_items(:one)
  end

  test 'should get index' do
    get fio_items_url
    assert_response :success
  end

  test 'should get new' do
    get new_fio_item_url
    assert_response :success
  end

  test 'should create fio_item' do
    post fio_items_url, params: { fio_import_form: { date_from: '01.11.2017', date_to: '30.11.2017', token_id: tokens(:one).id } }
    assert_redirected_to fio_items_url
  end

  test 'should destroy fio_item' do
    assert_difference('FioItem.count', 0) do
      delete fio_item_url(@fio_item)
    end

    @fio_item.reload
    assert_not_nil(@fio_item.deleted_at)
    assert_redirected_to fio_items_url
  end
end

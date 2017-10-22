class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.page(page_number).per(10)
    @index_chart = Items::GraphDataQuery.call
  end

  def show
  end

  def new
    @item = Fio::IdentifyItem.call(params.dig(:fio_item_id))
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if params.dig(:fio_item_id).present? && @item.save
      set_fio_item.destroy
      redirect_to fio_items_path, notice: 'Item was successfully created.'
    elsif @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_fio_item
    @fio_item = FioItem.find(params[:fio_item_id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :category_id, :buy_at)
  end
end

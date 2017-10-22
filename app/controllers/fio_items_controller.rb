class FioItemsController < ApplicationController
  before_action :set_fio_item, only: [:show, :edit, :update, :destroy]
  before_action :set_default_dates, only: [:new]

  def index
    @fio_items = FioItem.active.page(page_number)
  end

  def new
    @fio_import_form = FioImportForm.new
  end

  def create
    @fio_import_form = FioImportForm.new(fio_import_form_params)

    if @fio_import_form.save
      redirect_to fio_items_path, notice: 'Fio item was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @fio_item.update(deleted_at: DateTime.current)
    redirect_to fio_items_url, notice: 'Fio item was successfully destroyed.'
  end

  private

  def set_fio_item
    @fio_item = FioItem.find(params[:id])
  end

  def fio_import_form_params
    params.fetch(:fio_import_form, {}).permit(:date_from, :date_to, :token_id)
  end

  def set_default_dates
    @date_from = Date.current.at_beginning_of_month
    @date_to = Date.current.at_end_of_month
  end
end

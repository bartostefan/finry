module Fio
  class IdentifyItem
    include Service

    def initialize(fio_item_id)
      @fio_item_id = fio_item_id
    end

    def call
      identify
    end

    private

    def identify
      if @fio_item_id.present?
        item = Item.new

        if fio_item.comment
          splitted = fio_item.comment.split(':').map(&:strip)
          item.title = splitted[1]
          item.description = splitted[0]
        end
        item.price = fio_item.amount.abs
        item.buy_at = fio_item.date
        item
      else
        Item.new
      end
    end

    def fio_item
      @fio_item ||= FioItem.find(@fio_item_id) unless @empty_object
    end

    def change_to_date(date)
      Date.strptime(date)
    end
  end
end

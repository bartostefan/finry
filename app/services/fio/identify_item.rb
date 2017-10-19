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
      item = Item.new
      return item unless @fio_item_id.present?

      if splitted = split_comment(fio_item.comment)
        item.title, item.description = splitted[0], splitted[1]
      end
      item.price = fio_item.amount.abs
      item.buy_at = fio_item.date
      item
    end

    def fio_item
      @fio_item ||= FioItem.find(@fio_item_id)
    end

    def change_to_date(date)
      Date.strptime(date)
    end

    def split_comment(comment)
      return nil unless comment
      comment.split(':').map(&:strip)
    end
  end
end

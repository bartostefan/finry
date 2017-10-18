module Items
  class GraphDataQuery
    def self.call(relation = Item.all, options = { includes: :category, group: ['categories.title', 'strftime("%m-%Y", buy_at)'], sum: :price })
      relation
        .includes(options[:includes])
        .where.not(buy_at: nil)
        .group(options[:group])
        .sum(options[:sum])
    end
  end
end

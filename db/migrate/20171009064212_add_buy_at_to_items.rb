class AddBuyAtToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :buy_at, :datetime
  end
end

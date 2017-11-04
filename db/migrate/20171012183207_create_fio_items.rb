# frozen_string_literal: true

class CreateFioItems < ActiveRecord::Migration[5.1]
  def change
    create_table :fio_items do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.datetime :date
      t.text :comment
      t.string :transaction_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

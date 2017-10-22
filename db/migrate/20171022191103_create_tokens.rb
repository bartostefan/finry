class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :title
      t.string :token

      t.timestamps
    end
  end
end

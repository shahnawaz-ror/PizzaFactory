class CreateOrdersSides < ActiveRecord::Migration[7.1]
  def change
    create_table :orders_sides do |t|
      t.references :order, null: false, foreign_key: true
      t.references :side, null: false, foreign_key: true

      t.timestamps
    end
  end
end

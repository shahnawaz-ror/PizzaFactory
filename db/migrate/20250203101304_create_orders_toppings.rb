class CreateOrdersToppings < ActiveRecord::Migration[7.1]
  def change
    create_table :orders_toppings do |t|
      t.references :order, null: false, foreign_key: true
      t.references :topping, null: false, foreign_key: true

      t.timestamps
    end
  end
end

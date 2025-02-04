class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :pizza, foreign_key: true
      t.references :crust, foreign_key: true
      t.references :topping, foreign_key: true
      t.references :side, foreign_key: true
      t.decimal :total_price
      t.string :status

      t.timestamps
    end
  end
end

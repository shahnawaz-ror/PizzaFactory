class AddExtraCheeseToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :extra_cheese, :boolean
  end
end

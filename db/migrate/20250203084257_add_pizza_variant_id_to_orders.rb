class AddPizzaVariantIdToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :pizza_variant, null: false, foreign_key: true
  end
end

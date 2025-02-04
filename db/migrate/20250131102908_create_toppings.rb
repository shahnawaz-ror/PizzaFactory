class CreateToppings < ActiveRecord::Migration[7.1]
  def change
    create_table :toppings do |t|
      t.string :name
      t.decimal :price
      t.boolean :vegetarian


      t.timestamps
    end
  end
end

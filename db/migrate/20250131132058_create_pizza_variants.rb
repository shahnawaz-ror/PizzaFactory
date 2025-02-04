class CreatePizzaVariants < ActiveRecord::Migration[7.1]
  def change
    create_table :pizza_variants do |t|
      t.references :pizza, null: false, foreign_key: true
      t.string :size
      t.decimal :price

      t.timestamps
    end
  end
end

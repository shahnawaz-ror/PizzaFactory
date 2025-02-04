# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_02_03_103646) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crusts", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "item_type"
    t.integer "item_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.bigint "pizza_id"
    t.bigint "crust_id"
    t.bigint "topping_id"
    t.bigint "side_id"
    t.decimal "total_price"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pizza_variant_id", null: false
    t.boolean "extra_cheese"
    t.index ["category_id"], name: "index_orders_on_category_id"
    t.index ["crust_id"], name: "index_orders_on_crust_id"
    t.index ["pizza_id"], name: "index_orders_on_pizza_id"
    t.index ["pizza_variant_id"], name: "index_orders_on_pizza_variant_id"
    t.index ["side_id"], name: "index_orders_on_side_id"
    t.index ["topping_id"], name: "index_orders_on_topping_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_sides", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "side_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orders_sides_on_order_id"
    t.index ["side_id"], name: "index_orders_sides_on_side_id"
  end

  create_table "orders_toppings", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "topping_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orders_toppings_on_order_id"
    t.index ["topping_id"], name: "index_orders_toppings_on_topping_id"
  end

  create_table "pizza_variants", force: :cascade do |t|
    t.bigint "pizza_id", null: false
    t.string "size"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pizza_id"], name: "index_pizza_variants_on_pizza_id"
  end

  create_table "pizzas", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_pizzas_on_category_id"
  end

  create_table "sides", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.boolean "vegetarian"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "categories"
  add_foreign_key "orders", "crusts"
  add_foreign_key "orders", "pizza_variants"
  add_foreign_key "orders", "pizzas"
  add_foreign_key "orders", "sides"
  add_foreign_key "orders", "toppings"
  add_foreign_key "orders", "users"
  add_foreign_key "orders_sides", "orders"
  add_foreign_key "orders_sides", "sides"
  add_foreign_key "orders_toppings", "orders"
  add_foreign_key "orders_toppings", "toppings"
  add_foreign_key "pizza_variants", "pizzas"
  add_foreign_key "pizzas", "categories"
end

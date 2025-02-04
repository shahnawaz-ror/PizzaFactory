# Clear Existing Data
Order.destroy_all
Inventory.destroy_all
PizzaVariant.destroy_all
Pizza.destroy_all
Category.destroy_all
Crust.destroy_all
Topping.destroy_all
Side.destroy_all
User.destroy_all

# Create Users
admin = User.create!(email: "admin@example.com", password: "password", role: :admin)
vendor = User.create!(email: "vendor@example.com", password: "password", role: :vendor)
puts "Admin and Vendor Users Created!"

# Create Categories
vegetarian = Category.create!(name: "Vegetarian")
non_vegetarian = Category.create!(name: "Non-Vegetarian")
puts "Categories Created!"

# Create Pizzas
pizzas = [
  { name: "Deluxe Veggie", category: vegetarian, prices: { "Regular" => 150, "Medium" => 200, "Large" => 325 } },
  { name: "Cheese and Corn", category: vegetarian, prices: { "Regular" => 175, "Medium" => 375, "Large" => 475 } },
  { name: "Paneer Tikka", category: vegetarian, prices: { "Regular" => 160, "Medium" => 290, "Large" => 340 } },
  { name: "Non-Veg Supreme", category: non_vegetarian, prices: { "Regular" => 190, "Medium" => 325, "Large" => 425 } },
  { name: "Chicken Tikka", category: non_vegetarian, prices: { "Regular" => 210, "Medium" => 370, "Large" => 500 } },
  { name: "Pepper Barbecue Chicken", category: non_vegetarian, prices: { "Regular" => 220, "Medium" => 380, "Large" => 525 } }
]

pizzas.each do |pizza_data|
  pizza = Pizza.create!(name: pizza_data[:name], category: pizza_data[:category])
  pizza_data[:prices].each do |size, price|
    PizzaVariant.create!(pizza: pizza, size: size, price: price)
  end
end
puts "Pizzas and Variants Created!"

# Create Crusts
crusts = [
  { name: "New hand tossed", price: 0 },
  { name: "Wheat thin crust", price: 0 },
  { name: "Cheese Burst", price: 0 },
  { name: "Fresh pan pizza", price: 0 }
]
Crust.create!(crusts)
puts "Crusts Created!"

# Create Toppings
toppings = [
  { name: "Black Olive", price: 20, vegetarian: true },
  { name: "Capsicum", price: 25, vegetarian: true },
  { name: "Paneer", price: 35, vegetarian: true },
  { name: "Mushroom", price: 30, vegetarian: true },
  { name: "Fresh Tomato", price: 10, vegetarian: true },
  { name: "Chicken Tikka", price: 35, vegetarian: false },
  { name: "Barbeque Chicken", price: 45, vegetarian: false },
  { name: "Grilled Chicken", price: 40, vegetarian: false },
  { name: "Extra Cheese", price: 35, vegetarian: true }
]
Topping.create!(toppings)
puts "Toppings Created!"

# Create Sides
sides = [
  { name: "Cold drink", price: 55 },
  { name: "Mousse cake", price: 90 }
]
Side.create!(sides)
puts "Sides Created!"

# Create Inventory for Vendor
PizzaVariant.all.each { |variant| Inventory.create!(item_type: "PizzaVariant", item_id: variant.id, quantity: 50) }
Topping.all.each { |topping| Inventory.create!(item_type: "Topping", item_id: topping.id, quantity: 100) }
Side.all.each { |side| Inventory.create!(item_type: "Side", item_id: side.id, quantity: 75) }
puts "Inventory Added for Vendor!"

puts "Database Seeded Successfully! 🚀"

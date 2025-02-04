Rails.application.routes.draw do
  # Devise Routes for Authentication (Login, Signup)
  devise_for :users
  
  # Root Route - Landing Page
  root "orders#home" # Set the home page to PizzasController#home

  resources :categories, only: [:index, :show]
  resources :orders
  resources :sides, only: [:index, :show]

 resources :pizzas, only: [:index]
 resources :pizza_variants, only: [:index]
 resources :toppings, only: [:index]

  # Inventory Management (Vendor)
  resources :inventories, only: [:index, :update]
  
end

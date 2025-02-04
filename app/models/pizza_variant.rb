class PizzaVariant < ApplicationRecord
  belongs_to :pizza

  validates :size, presence: true, inclusion: { in: ["Regular", "Medium", "Large"] }
  validates :price, presence: true, numericality: { greater_than: 0 }
end

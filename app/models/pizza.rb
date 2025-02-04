class Pizza < ApplicationRecord
  belongs_to :category
  has_many :pizza_variants, dependent: :destroy
  has_many :orders
end

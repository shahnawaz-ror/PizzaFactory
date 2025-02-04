# spec/controllers/orders_controller_spec.rb
require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  include Devise::Test::ControllerHelpers
  
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:pizza) { create(:pizza, category: category) }
  let(:crust) { create(:crust) }
  let(:pizza_variant) { create(:pizza_variant) }
  let(:valid_attributes) do
    {
      category_id: category.id,
      pizza_id: pizza.id,
      crust_id: crust.id,
      pizza_variant_id: pizza_variant.id,
      topping_ids: [create(:topping).id],
      side_ids: [create(:side).id],
      extra_cheese: false,
      total_price: 100.0
    }
  end

  before { sign_in user }

  describe "GET #home" do
    # ... existing test ...
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new order" do
        expect {
          post :create, params: { order: valid_attributes }
        }.to change(Order, :count).by(1)
        expect(response).to redirect_to(Order.last)
      end
    end
  end
end
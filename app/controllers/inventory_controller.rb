class InventoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_vendor

  def update
    inventory = Inventory.find(params[:id])
    inventory.update(quantity: params[:quantity])
    redirect_to inventories_path, notice: "Inventory updated."
  end

  private

  def check_vendor
    redirect_to root_path, alert: "Access Denied!" unless current_user.vendor?
  end
end

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    Item.create(item_params)
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :shipping_charges_id, :shipping_region_id, :days_until_shipping_id, :price, :user_id)
  end
end

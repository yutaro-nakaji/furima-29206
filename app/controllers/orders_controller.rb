class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderShipping.new
  end

  def create
    @order = OrderShipping.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

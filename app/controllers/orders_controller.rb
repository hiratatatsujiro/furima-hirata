class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_buyer = OrderByer.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new(order_buyer_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_buyer_params
    params.require(:order_buyer).permit(:postal_code, :delivery_area_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

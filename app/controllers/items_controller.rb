class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
   @item = Item.new
  end

  def create
   @item = Item.new(item_params)
   if @item.valid?
     @item.save
     redirect_to root_path
   else
     render :new
   end
  end

  def edit
   @item = Item.find(params[:id]) 
  end

  def update
   @item = Item.find(params[:id])
   if @item.valid?
    @item.update(item_params)
    redirect_to item_path(@item)
   else
    render :edit 
   end
  end

  def show
   @item = Item.find(params[:id])
  end

  def destroy
   @item = Item.find(params[:id])
   @item.destroy
   redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduce, :category_id, :status_id, :pay_for_shopping_id, :delivery_area_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end
end

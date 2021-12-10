class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :find_params, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user)
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
  
  end

  def update
   
   if @item.valid?
    @item.update(item_params)
    redirect_to item_path(@item)
   else
    render :edit 
   end
  end

  def show
   
  end

  def destroy
   
   @item.destroy
   redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduce, :category_id, :status_id, :pay_for_shopping_id, :delivery_area_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id]) 
  end

  def move_to_index
    unless user_signed_in? && @item.user_id == current_user.id 
      redirect_to root_path
    end
  end
end

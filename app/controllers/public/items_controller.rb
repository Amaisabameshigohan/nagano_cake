class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem
  end

private
  def item_params
    params.require(:items).permit(:name,:image_id,:price)
  end
 
end

class Admin::ItemsController < ApplicationController
  def new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_item_path(item.id)
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


  def update
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active)
  end
end
class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    # @cart_items = Cart_item.all
  end

end

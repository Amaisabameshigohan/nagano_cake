class Public::OrdersController < ApplicationController
    def new
      @order = Order.new
    end
    
    def confirm
        
    end
    
    def complete
        
    end
    
    def create
      @order = Order.new(order_params)
      if @order.save
        redirect_to root_path
      else
        render 'new'
      end
    end
    
    private
    
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end
end

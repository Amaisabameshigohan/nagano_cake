class Public::OrdersController < ApplicationController
    def index
      @orders = current_customer.orders.all
      @cart_items = current_customer.cart_items.all
    end

    def new
      @order = Order.new
    end

    def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      if @order.save
        @cart_items = current_customer.cart_items
        @cart_items.destroy_all
        redirect_to orders_complete_path
      else
        render :new
      end
    end

    def confirm
      @cart_items = current_customer.cart_items.all
      @order = Order.new(order_params)
      @order.payment_method = params[:order][:payment_method]
      @order.shipping_cost = 800

      if params[:order][:select_address] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
        render :confirm
      elsif params[:order][:select_address] == "1"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:order][:select_address] == "2"
          @order.postal_code = @order.postal_code
          @order.address = @order.address
          @order.name = @order.name
      else
        render :new
      end
    end

    def complete

    end

    def show
      @order = Order.find(params[:id])
      @cart_items = current_customer.cart_items.all
    end

    private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
    end

    def address_params
      params.require(:order).permit(:postal_code, :address, :name)
    end
end

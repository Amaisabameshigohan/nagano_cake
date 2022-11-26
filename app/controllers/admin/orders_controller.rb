class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      # 注文ステータスが入金確認になったら製作ステータス全て製作待ちに
      if @order.status == "入金確認"
        @order.order_details.update_all(making_status: :production_pending)
      end
      redirect_to request.referer
    else
      render "show"
    end
  end




  private

  def order_params
    params.require(:order).permit(:status)
  end

end

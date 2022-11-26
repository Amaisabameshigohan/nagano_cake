class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:order_detail][:order_detail_id])
    @order = @order_detail.order
    if @order_detail.update(order_update_params)
      # 製作ステータスが1つでも製作中になったら注文ステータスが製作中に
      if @order_detail.making_status == "in_production"
        @order.update(status: :製作中)
      # 製作ステータスが全て製作完了になったら注文ステータスが発送準備中に
      elsif @order.order_details.count == @order.order_details.where(making_status: "production_complete").count
        @order.update(status: :発送準備中)
      end
      redirect_to request.referer
    end
  end




    private

    def order_update_params
      params.require(:order_detail).permit(:making_status)
    end

end

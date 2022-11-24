class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "内容を変更しました"
      redirect_to admin_customer_path
    else
      flash[:notice] = "保存できませんでした"
      render :edit
    end
  end


  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :telephone_number, :postal_code, :email, :is_deleted)
  end

end

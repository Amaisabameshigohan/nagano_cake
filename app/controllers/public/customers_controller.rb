class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_information_edit_path
    else
      render "edit"
    end
  end

  def unsubscribe
    @customer = current_customer
  end
  
  
  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :telephone_number, :postal_code, :email)
  end

  
end

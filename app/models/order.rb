class Order < ApplicationRecord
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def sum_of_price
    item.taxin_price * quantity
  end  
end

class Order < ActiveRecord::Base
  has_many :order_details
  has_many :products, through: :order_details

  def total_price
    order_details.sum(:total_price)
  end
end

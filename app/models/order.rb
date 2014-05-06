class Order < ActiveRecord::Base
  has_many :order_details
  accepts_nested_attributes_for :order_details

  has_many :products, through: :order_details
  belongs_to :user

  def total_price
    order_details.sum(:total_price)
  end
end

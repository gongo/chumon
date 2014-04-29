class OrderDetail < ActiveRecord::Base
  before_save { self.total_price = product.price * count }

  belongs_to :product
  belongs_to :order
end

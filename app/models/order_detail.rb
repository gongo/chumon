class OrderDetail < ActiveRecord::Base
  before_save { self.total_price = product.price * count }

  validates :count, numericality: { greater_than: 0 }

  belongs_to :product
  belongs_to :order
end

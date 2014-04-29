class OrderDetailsController < ApplicationController
  def index
    @order_details = OrderDetail.all
  end

  def show
    @detail = OrderDetail.find(1)
  end
end

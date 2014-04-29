class OrderDetailsController < ApplicationController
  def index
    @order_details = OrderDetail.all
  end

  def show
  end
end

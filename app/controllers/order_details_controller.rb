class OrderDetailsController < ApplicationController
  def index
    @order_details = OrderDetail.all
  end

  def show
    @detail = OrderDetail.find(params[:id])
  end

  def new
    @detail = OrderDetail.new
  end

  def create
    @detail = OrderDetail.new(params[:order_detail])

    if @detail.save
      redirect_to @detail
    else
      render action: 'new'
    end
  end
end

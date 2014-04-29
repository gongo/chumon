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
    p params
    @detail = OrderDetail.new
    render action: 'new'
  end
end

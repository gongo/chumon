class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    3.times { @order.order_details.build }
    @products = Product.all
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
      @products = Product.all
      render action: 'new'
    end
  end

  private

    def order_params
      params.require(:order).permit(order_details_attributes: [:product_id, :count])
    end
end

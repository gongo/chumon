class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    session[:cart].each do |product_id|
      @order.order_details.build(product_id: product_id)
    end
    @products = Product.all
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      session[:cart] = []
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

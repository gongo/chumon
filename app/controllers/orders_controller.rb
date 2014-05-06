class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create]

  def index
    @orders = current_user.orders
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

    def logged_in_user
      redirect_to new_sessions_path, alert: 'ログインしてください' unless logged_in?
    end
end

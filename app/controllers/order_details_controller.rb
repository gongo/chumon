class OrderDetailsController < ApplicationController
  before_action :set_detail, only: [:show, :edit, :update, :destroy]

  def index
    @order_details = OrderDetail.all
  end

  def show
  end

  def new
    @detail = OrderDetail.new
  end

  def create
    @detail = OrderDetail.new(order_details_params)

    if @detail.save
      redirect_to @detail
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @detail.update(order_details_params)
      redirect_to @detail
    else
      render action: 'edit'
    end
  end

  def destroy
    @detail.destroy
    redirect_to order_details_url
  end

  private

    def set_detail
      @detail = OrderDetail.find(params[:id])
    end

    def order_details_params
      params.require(:order_detail).permit(:order_id, :product_id, :count)
    end
end

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
    @detail = OrderDetail.new(order_details_params)

    if @detail.save
      redirect_to @detail
    else
      render action: 'new'
    end
  end

  def edit
    @detail = OrderDetail.find(params[:id])
  end

  def update
    @detail = OrderDetail.find(params[:id])

    if @detail.update(order_details_params)
      redirect_to @detail
    else
      render action: 'edit'
    end
  end

  def destroy
    @detail = OrderDetail.find(params[:id])
    @detail.destroy
    redirect_to order_details_url
  end

  private

    def order_details_params
      params.require(:order_detail).permit(:order_id, :product_id, :count)
    end
end

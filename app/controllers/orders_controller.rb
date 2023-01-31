class OrdersController < ApplicationController
    
  def create
    @order = Order.new(
      price:,
      quantity:,
      serial:,
      remark:,
      product_name:,
      shop:,
    )
    if order.save
      redirect_to customer_orders_path ,alert:"成功建立訂單"
    else
      redirect_to "#"
    end

  end

  def index
    @orders = Order.all
  end

  def show
    @orders = Order.all
  end

private
  def clean_order
    params.require(:order).permit(:price, :quantity, :serial, :remark, :product_name, :shop)
  end
end

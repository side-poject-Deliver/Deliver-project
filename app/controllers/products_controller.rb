class ProductsController < ApplicationController
  before_action :find_shop, only: %i[index create edit update new]
  before_action :find_product ,only: %i[index show edit destroy]

  def index
    @products = @shop.products
  end

  def new
    @product = @shop.products.new
  end

  def create
    @product = @shop.products.new(clean_product)
    if @product.save
      redirect_to shop_products_path , notice: "新增商品成功"
    else
      render :new , notice: "商品新增失敗，請重新確認"
    end
  end

  def show
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(clean_product)
        redirect_to shop_products_path , notice: "更新商品成功"
      else
        render :edit , notice: "商品更新失敗，請重新確認"
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to shop_products_path , notice: "商品移除成功"
  end
  
  private
  def clean_product
    params.require(:product).permit(:product_name ,:price ,:quantity ,:note)
  end

  def find_shop
    @shop = Shop.find_by(id: params[:shop_id])
  end

  def find_product
    @product = Product.find_by(id: params[:product_id])
  end
end

class ProductsController < ApplicationController
  before_action :find_product ,only: %i[show edit update destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(clean_product)

    if @product.save
      redirect_to products_path , notice: "新增商品成功"
    else
      render :new , alert: "商品新增失敗，請重新確認"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(clean_product)
      redirect_to products_path , notice: "更新商品成功"
    else
      render :edit , alert: "商品更新失敗，請重新確認"
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path , notice: "商品移除成功"
  end
  private
  def clean_product
    params.require(:product).permit(:product_name ,:price ,:quantity ,:note)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end

class ShopsController < ApplicationController
before_action :find_shop, only: [:edit, :update, :show, :destroy]
  def index
    @shops = Shop.all
  end
  
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params) 
      p "="*100
      p @shop
      p"="*100

    if @shop.save
      p "="*100
      p @shop
      p"="*100
      redirect_to shops_path, notice: '成功新增商店！'
    else
       p "="*100
      p @shop
      p"="*100
    #   render :new, alert: '新增商店失敗，請重新確認'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to owner_shop_path, notice: '成功更新商店！'
    else
      render :edit, alert: '商店資訊更新失敗，請重新確認'
    end
  end

  def destroy
    @shop.destroy
    redirect_to owner_shops_path, alert: '商店已刪除'
  end

private

  def shop_params
    params.require(:shop).permit(:title, :address, :phone, :tax_number, :logo, :start_at, :end_at, :tag)
  end

  def find_shop
    @shop = Shop.find(params[:id])
  end
end

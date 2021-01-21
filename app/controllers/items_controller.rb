class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end
  
  private 
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :condition_id, :category_id, :postage_id, :shipping_days_id, :prefecture_id).merge(user_id: current_user.id)
  end
end

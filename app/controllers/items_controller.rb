class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.all.order(created_at: "DESC")
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
    @item = Item.find(params[:id])
  end
  
  private 
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :condition_id, :category_id, :postage_id, :shipping_days_id, :prefecture_id).merge(user_id: current_user.id)
  end
end

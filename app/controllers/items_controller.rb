class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]
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
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if current_user == @item.user
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render action: :edit
      end
    else
      redirect_to root_path  
    end
  end
  
  private 
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :condition_id, :category_id, :postage_id, :shipping_days_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

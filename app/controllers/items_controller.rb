class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.save
      render root_path
    else
      render action: :new
    end
  end

  def show
  end
  
  private 
  
end

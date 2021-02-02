class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if @item.order.present? || current_user == @item.user
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    set_item
    Payjp.api_key = "sk_test_c75cc8377b452e69fea4ff31" 
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],  
      currency: 'jpy'
    )
  end
end

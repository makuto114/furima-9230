require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe "商品購入" do
    before do
      @order_shipping_address = FactoryBot.build(:order_shipping_address)
      @order = FactoryBot.build(:order)
    end

    context "商品が購入できるとき" do

      it "全ての情報が正しく入力されていれば商品購入ができること" do
        expect(@order_shipping_address). to be_valid
      end
    end

    context "商品が購入できないとき" do
      it "tokenが空だと購入できない" do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages). to include("Token can't be blank")
      end

      it "郵便番号が空だと購入できない" do
        @order_shipping_address.postal_code = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages). to include("Postal code can't be blank")
      end

      it "郵便番号にハイフンがないと購入できない" do
        @order_shipping_address.postal_code = "1230815"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages). to include("Postal code is invalid")
      end

      it "都道府県が未選択だと購入できない" do
        @order_shipping_address.prefecture_id = 0
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages). to include("Prefecture must be greater than 0")
      end

      it "市区町村が空だと購入できない" do
        @order_shipping_address.city = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages). to include("City can't be blank")
      end

      it "番地が空だと購入できない" do
        @order_shipping_address.house_number = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages). to include("House number can't be blank")
      end

      it "電話番号が空だと購入できない" do
        @order_shipping_address.phone_number = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages). to include("Phone number can't be blank")
      end

      it "電話番号は11桁以内でないと登録できない" do
        @order_shipping_address.phone_number = "12345678912345"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages). to include("Phone number is invalid")
      end

      it "電話番号にハイフンがあると登録できない" do
        @order_shipping_address.phone_number = "383-5089"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages). to include("Phone number is invalid")
      end

    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品" do
    before do
      @item = FactoryBot.build(:item)
    end

    #正常系テスト?

    it "カラムが全て、正しい形式で埋まっていれば商品出品されること" do
      expect(@item). to be_valid
    end

    #異常系テスト

    it "商品名が空だと出品できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Name can't be blank")
    end

    it "商品説明が空だと出品できない" do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Introduction can't be blank")
    end

    it "画像が添付されてないと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Image can't be blank")
    end

    it "カテゴリーが未選択だと出品できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Category can't be blank")
    end

    it "カテゴリーが0だと出品できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages). to include("Category must be other than 0")
    end

    it "商品状態が未選択だと出品できない" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Condition can't be blank")
    end

    it "商品状態の選択が0だと出品できない" do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages). to include("Condition must be other than 0")
    end

    it "配送料負担が未選択だと出品できない" do
      @item.postage_id = nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Postage can't be blank")
    end

    it "配送料負担の選択が0だと出品できない" do
      @item.postage_id = 0
      @item.valid?
      expect(@item.errors.full_messages). to include("Postage must be other than 0")
    end

    it "発送元地域が未選択だと出品できない" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Prefecture can't be blank")
    end

    it "発送元地域の選択が0だと出品できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages). to include("Prefecture must be other than 0")
    end

    it "発送までの日数が未選択だと出品できない" do
      @item.shipping_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Shipping days can't be blank")
    end

    it "発送までの日数の選択が0だと出品できない" do
      @item.shipping_days_id = 0
      @item.valid?
      expect(@item.errors.full_messages). to include("Shipping days must be other than 0")
    end

    it "価格が空だと出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Price can't be blank")
    end

    it "価格が300円未満だと出品できない" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages). to include("Price must be greater than 299")
    end

    it "価格が9,999,999円より高いと出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages). to include("Price must be less than 10000000")
    end

    it "価格入力が半角英数以外だと出品できない" do
      @item.price = "９９９９"
      @item.valid?
      expect(@item.errors.full_messages). to include("Price is not a number")
    end
  
  end
end

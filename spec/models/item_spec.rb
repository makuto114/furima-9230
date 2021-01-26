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
  end
end

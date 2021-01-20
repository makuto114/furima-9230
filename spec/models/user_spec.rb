require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do 
    before do
      @user = FactoryBot.build(:user)
    end

    # 正常系テスト
    it "カラムが全て記入されていれば登録できること" do
     expect(@user). to be_valid
    end

    # 異常系テスト
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages). to include("Nickname can't be blank")
    end

    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages). to include("Email can't be blank")
    end

    it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages). to include("Email has already been taken")
    end

    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages). to include("Password can't be blank")
    end

    it "passwordが６文字未満だと登録できない" do
      @user.password = "1234a"
      @user.password_confirmation = "1234a"
      @user.valid?
      expect(@user.errors.full_messages). to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordには英字と数字の両方が含まれていないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages). to include("Password is invalid")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages). to include("Password confirmation doesn't match Password")
    end

    it "familiy_nameが空だと登録できない" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages). to include("Family name can't be blank")
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages). to include("First name can't be blank")
    end

    it "family_name_rubyが空だと登録できない" do
      @user.family_name_ruby = nil
      @user.valid?
      expect(@user.errors.full_messages). to include("Family name ruby can't be blank")
    end

    it "first_name_rubyが空だと登録できない" do
      @user.first_name_ruby = nil
      @user.valid?
      expect(@user.errors.full_messages). to include("First name ruby can't be blank")
    end

    it "family_name_rubyが全角カタカナ以外だと登録できない" do
      @user.family_name_ruby = "さかな"
      @user.valid?
      expect(@user.errors.full_messages). to include("Family name ruby is invalid")
    end

    it "first_name_rubyが全角カタカナ以外だと登録できない" do
      @user.first_name_ruby = "魚"
      @user.valid?
      expect(@user.errors.full_messages). to include("First name ruby is invalid")
    end

    it "birth_dateが空だと登録できない" do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages). to include("Birth date can't be blank")
    end
  end
end

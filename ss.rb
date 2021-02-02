# フォームオブジェクト
class PurchaseAddress
  include ActiveModel::Model
  # attr_accessor  保存するカラムをコントローラーから持ってくる
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city,
                :banchi, :building, :phone_number, :token
  # バリデーション
  # 郵便番号
    validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, }
  # 都道府県
    validates :prefecture_id, numericality: { other_than: 1 }
  # 電話番号
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, }
    with_options presence: true do
      # 市区町村
      validates :city
      # 番地
      validates :banchi
      # ユーザー情報
      validates :user_id
      # 商品情報
      validates :item_id
      # クレジットカード情報のトークン
      validates :token
    end
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code:  postal_code,  prefecture_id:  prefecture_id,  city:        city,        banchi: banchi,
                   phone_number: phone_number, building:       building,       purchase_id: purchase.id)
  end
end
10:11
@yuma_ito
購入履歴テーブル
class Purchase < ApplicationRecord
  has_one    :addresse
  belongs_to :user
  belongs_to :item
end


住所テーブル
class Address < ApplicationRecord
  belongs_to :purchase
end


const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const form = document.getElementById(“charge-form”);
  form.addEventListener(“submit”, (e) => {
    // レイルズ側の送信処理を止めているのが、e.preventDefault();
    e.preventDefault();

// “charge-form”というidでフォームの情報を取得し、それをFormDataオブジェクトとして生成
    const formResult = document.getElementById(“charge-form”);
    const formData = new FormData(formResult);

// 生成したFormDataオブジェクトから、クレカの情報を取得し、変数cardに代入するオブジェクトとして定義
// FormData.get  name属性と一致するhtml要素の値を取りに行く
    const card = {
      number: formData.get(“purchase_address[number]“),
      cvc: formData.get(“purchase_address[cvc]“),
      exp_month: formData.get(“purchase_address[exp_month]“),
      exp_year: `20${formData.get(“purchase_address[exp_year]“)}`,
    };


// createTokenメソッドの第一引数には、10〜15行目で定義したクレジットカード情報が入る
// 第二引数にはアロー関数を用いて、レスポンスを受け取ったあとの処理
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
  // トークンの値をフォームに含める。JavaScriptでinput要素を生成しフォームに加え、その値としてトークンをセット
        const renderDom = document.getElementById(“charge-form”);
        const tokenObj = `<input value=${token} name=‘token’ type=“hidden”> `;
        renderDom.insertAdjacentHTML(“beforeend”, tokenObj);
      }
      // getElementByIdはid属性と一致するhtml要素を取りに行く
      document.getElementById(“card-number”).removeAttribute(“name”);
      document.getElementById(“card-cvc”).removeAttribute(“name”);
      document.getElementById(“card-exp-month”).removeAttribute(“name”);
      document.getElementById(“card-exp-year”).removeAttribute(“name”);
      document.getElementById(“charge-form”).submit();
    });
  });
};
window.addEventListener(“load”, pay);



















class Item < ApplicationRecord
  validates :name, :introduction, :price, :user, :category_id, :condition_id, :postage_id, :shipping_days_id, :prefecture_id, presence: true
  
  belongs_to :user
  has_one    :order
end

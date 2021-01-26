class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_days

  belongs_to       :user
  has_one          :order
  has_one_attached :image
  
  validates :name, :introduction, :image, presence: true

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }

  validates :category_id, :condition_id, :postage_id, :shipping_days_id, :prefecture_id, presence: true, numericality: { other_than: 0 }
  
end

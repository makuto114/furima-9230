class Order < ApplicationRecord
  attr_accessor :token
  has_one :item
  has_one :shipping_address, dependent: :destroy
  belongs_to :user
end

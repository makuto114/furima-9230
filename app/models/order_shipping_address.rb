class OrderShippingAddress

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token, :city, :house_number, :user_id, :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/	}
    validates :prefecture_id, numericality: { greater_than: 0 }
    validates :phone_number, format: {with: /\A\d{11}\z/ }
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end

end
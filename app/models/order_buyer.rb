class OrderBuyer
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :delivery_area_id, :city, :house_number, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
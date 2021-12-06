class Buyer < ApplicationRecord
  belongs_to :orders

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
  end

  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
end

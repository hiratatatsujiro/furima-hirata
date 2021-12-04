class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :introduce
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :pay_for_shipping_id
    validates :delivery_area_id
    validates :day_to_ship_id
  end
end

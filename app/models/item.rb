class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_area
  belongs_to :pay_for_shopping
  belongs_to :day_to_ship

  with_options presence: true do
    validates :name
    validates :introduce
    validates :price
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :pay_for_shopping_id
    validates :delivery_area_id
    validates :day_to_ship_id
  end
end

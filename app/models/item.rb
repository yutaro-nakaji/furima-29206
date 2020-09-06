class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :shipping_region_id
    validates :days_until_shipping_id
  end
  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates :price, presence: true, inclusion: {in: 300..9999999 }, format: { with: PRICE_REGEX }
end

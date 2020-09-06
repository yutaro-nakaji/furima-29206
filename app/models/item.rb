class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :shipping_region_id
    validates :days_until_shipping_id
  end
  validates :price, presence: true, inclusion: {in: 300..9999999 }
end

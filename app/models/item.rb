class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_charges_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_region_id, presence: true, numericality: { other_than: 1 }
  validates :days_until_shipping_id, presence: true, numericality: { other_than: 1 }
  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: PRICE_REGEX }
end

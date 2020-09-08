class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_until_shipping

  validate :image_presence
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :status_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_charges_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_region_id, numericality: { other_than: 1, message: 'Select' }
  validates :days_until_shipping_id, numericality: { other_than: 1, message: 'Select' }
  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates :price, presence: true, format: { with: PRICE_REGEX }, inclusion: { in: 300..9_999_999 }
end

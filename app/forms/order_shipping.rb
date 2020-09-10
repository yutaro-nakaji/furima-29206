class OrderShipping

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number

  

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  validates :postal_code, presence: true, format: { with: POSTAL_CODE_REGEX }
  validates :prefecture, numericality: { other_than: 1, message: 'Select' }
  validates :city, presence: true
  validates :house_number, presence: true
  PHONE_NUMBER_REGEX = /\A\d{11}\z/.freeze
  validates :phone_number, presence: true, format: { with: PHONE_NUMBER_REGEX }

  def save
    order = Order.create(user_id: @user.id, item_id: @item.id)
    Shipping.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end
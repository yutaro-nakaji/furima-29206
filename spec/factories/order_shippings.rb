FactoryBot.define do
  factory :order_shipping do
    token         { 'tok_a480b472987c6c151166ac782983' }
    postal_code   { '123-4567' }
    prefecture    { '2' }
    city          { '所沢市' }
    house_number  { 'ああああ町11' }
    building_name { '渋谷スクランブルスクエア' }
    phone_number  { '09011111111' }
  end
end

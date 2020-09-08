FactoryBot.define do
  factory :item do
    name                   { 'TechCampエンジニア転職コース' }
    explanation            { '10週間で人生が変わる、No.1エンジニア養成プログラム' }
    category_id            { '2' }
    status_id              { '2' }
    shipping_charge_id { '2' }
    shipping_region_id     { '2' }
    days_until_shipping_id { '2' }
    price                  { '711480' }
    association :user
  end
end

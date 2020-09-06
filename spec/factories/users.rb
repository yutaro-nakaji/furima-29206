FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { '1a1a1a' }
    password_confirmation { password }
    nickname              { Faker::Name.name }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday              { '1995-11-17' }
  end
end

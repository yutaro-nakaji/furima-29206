FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.email}
    #password              {Faker::Internet.password(min_length: 6)}
    password              {"1a1a1a"}
    password_confirmation {password}
    nickname              {Faker::Name.name}
    #first_name            {Faker::Japanese::Name.first_name}
    #last_name             {Faker::Japanese::Name.last_name}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    #birthday              {Faker::Date.between(from: '1930-01-01', to: '2014-09-05')}
    birthday              {"1995-11-17"}
  end
end
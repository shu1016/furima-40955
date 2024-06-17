FactoryBot.define do
  factory :user do
    id                    { 1 }
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           { "田ナか" }
    last_name             { "太ロう" }
    family_name_kana      { "タナカ" }
    last_name_kana        { "タロウ" }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2019-12-31') }
  end
end
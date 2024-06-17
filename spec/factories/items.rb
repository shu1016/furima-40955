FactoryBot.define do
  factory :item do
    association :user
    name                  {Faker::Name.initials(number: 2)}
    content               {Faker::Lorem.sentence}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
    category_id           {Category.where.not(id: 1).sample.id}
    status_id             {Status.where.not(id: 1).sample.id}
    cost_id               {Cost.where.not(id: 1).sample.id}
    region_id             {Region.where.not(id: 1).sample.id}
    period_id             {Period.where.not(id: 1).sample.id}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

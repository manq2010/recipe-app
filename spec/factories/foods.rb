FactoryBot.define do
  factory :food do
    name { 'MyString' }
    measurement_unit { 'MyString' }
    price { 10 }
    quantity { 20 }
    user { nil }
  end
end

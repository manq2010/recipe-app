FactoryBot.define do
  factory :recipe_food do
    quantity { 10 }
    user { nil }
    food { nil }
    recipe { nil }
  end
end

class RecipeFood < ApplicationRecord
  belongs_to :user
  belongs_to :food
  belongs_to :recipe
end

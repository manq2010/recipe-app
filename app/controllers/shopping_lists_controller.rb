class ShoppingListsController < ApplicationController
  def index

    @recipe_foods = RecipeFood.includes(:food).where(user_id: current_user.id)

    # Get the general list of food for the user
    @foods = current_user.foods
    # user_foods = current_user.foods

  end
end

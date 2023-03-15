class ShoppingListsController < ApplicationController
  # def index
  #   @user = current_user
  #   @recipe = Recipe.find(params[:recipe_id])
  #   @recipe_foods = @recipe.recipe_foods.includes([:food])
  #   @total_price = 0
  #   @total_ingredients = 0
  #   @missing_foods = []
  #   @recipe_foods.each do |ingredient|
  #     next if (ingredient.quantity) <= (Food.find(ingredient.food_id).quantity)
  #     @total_price += (ingredient.quantity - Food.find(ingredient.food_id).quantity) * ingredient.food.price
  #     @total_ingredients += 1
  #     @missing_foods << ingredient
  #   end

  # end

  def index
    # Get the recipe foods for the user, including associated foods
    @recipe_foods = RecipeFood.includes(:food).where(user_id: current_user.id)

    # # Get the general list of food for the user
    # @foods = current_user.foods

    # Calculate the total count and price of missing food items
    @total_missing_count = 0
    @total_missing_price = 0

    # Get the list of missing food items for the specified recipe
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @missing_foods = []

    @recipe_foods.each do |ingredient|
      next unless ingredient.quantity > ingredient.food.quantity

      @missing_foods << ingredient
      @total_missing_count += 1
      @total_missing_price += (ingredient.quantity - ingredient.food.quantity) * ingredient.food.price
    end
  end
end

class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.public_recipes
  end
end

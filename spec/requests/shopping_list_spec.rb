require 'rails_helper'

RSpec.describe 'ShoppingLists', type: :request do
  describe 'GET /recipes/:recipe_id/shopping_lists' do
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
    end

    it 'returns http success' do
      food = Food.new(name: 'Apple Test', measurement_unit: 'grams', price: 10, quantity: 30, user_id: user.id)
      recipe = Recipe.new(name: 'Test Recipe', preparation_time: 10, cooking_time: 20, user_id: user.id)
      RecipeFood.new(quantity: 50, user_id: user.id, food_id: food.id, recipe_id: recipe.id)

      get '/shopping_lists'
      expect(response).to have_http_status(:success)
    end
  end
end

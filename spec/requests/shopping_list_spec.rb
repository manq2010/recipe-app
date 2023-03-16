require 'rails_helper'

RSpec.describe 'ShoppingLists', type: :request do
  describe 'GET /recipes/:recipe_id/shopping_lists' do
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
    end

    it 'returns http success' do
      recipe = Recipe.new(name: 'Test Recipe', preparation_time: 10, cooking_time: 20, user_id: user.id)
      get "/recipes/#{recipe.id}/shopping_lists"
      expect(response).to have_http_status(:success)
    end
  end
end

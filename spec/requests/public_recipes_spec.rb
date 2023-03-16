require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET /index' do
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
    end

    it 'returns http success' do
      Recipe.new(name: 'Test Recipe', preparation_time: 10, cooking_time: 20, public: true, user_id: user.id)

      get '/public_recipes/'
      expect(response).to have_http_status(:success)
    end
  end
end

require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/recipes/1/recipe_foods/new').to route_to('recipe_foods#new', recipe_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/recipes/1/recipe_foods').to route_to('recipe_foods#create', recipe_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/recipes/1/recipe_foods/1').to route_to('recipe_foods#destroy', recipe_id: '1', id: '1')
    end
  end
end

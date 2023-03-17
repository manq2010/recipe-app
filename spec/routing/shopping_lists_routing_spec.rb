require 'rails_helper'

RSpec.describe ShoppingListsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'shopping_lists').to route_to('shopping_lists#index')
    end
  end
end

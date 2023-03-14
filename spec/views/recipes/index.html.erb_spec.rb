require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
      FactoryBot.create(:recipe, name: "Recipe 1", description: "Description 1", user: user)
      FactoryBot.create(:recipe, name: "Recipe 2", description: "Description 2", user: user)
  end

  it "displays a link to create a new recipe" do
    render

    assert_select ".new-recipe-link-div" do
      assert_select "a.new-recipe-link[href=?]", new_recipe_path, text: "New recipe"
    end
  end

  
end

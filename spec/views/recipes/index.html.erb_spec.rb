# spec/views/recipes/index.html.erb_spec.rb

require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    assign(:recipes, [
      FactoryBot.create(:recipe, name: "Recipe 1", description: "Description 1", user: user),
      FactoryBot.create(:recipe, name: "Recipe 2", description: "Description 2", user: user)
    ])
  end

  it "displays the recipes" do
    render

    assert_select "h1", text: "Recipes"
    assert_select "#recipes" do
      assert_select "#recipe", count: 2
    end
  end

  it "displays a link to create a new recipe" do
    render

    assert_select ".new-recipe-link-div" do
      assert_select "a.new-recipe-link[href=?]", new_recipe_path, text: "New recipe"
    end
  end

  it "displays the recipe details" do
    render

    assert_select "#recipes" do
      assert_select "#recipe" do |elements|
        elements.each_with_index do |element, index|
          recipe = assigns(:recipes)[index]

          assert_select element, "p", text: recipe.name
          assert_select element, "p", text: recipe.description
          assert_select element, "form[action=?][method=?]", recipe_path(recipe), "post" do
            assert_select "input[name=_method][value=delete]", count: 1
            assert_select "input[type=submit][value='Delete recipe']", count: 1
          end
        end
      end
    end
  end
end

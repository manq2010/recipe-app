require 'rails_helper'

RSpec.feature 'Shopping index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
    visit shopping_lists_path
  end

  scenario 'Displays details general shopping list' do
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Amount of food items to buy: 0')
    expect(page).to have_content('Total value of food: $0')
    expect(page).to have_content('Food')
    expect(page).to have_content('Back to recipe')
  end
end

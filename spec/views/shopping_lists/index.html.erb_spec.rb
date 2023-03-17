require 'rails_helper'

RSpec.feature 'Shopping index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    sleep(1)
  end

  scenario 'Displays details general shopping list' do
    click_on 'General Shopping List'
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Amount of food items to buy: 0')
    expect(page).to have_content('Total value of food: $0')
    expect(page).to have_content('Food')
    expect(page).to have_content('Back to recipe')
  end
end

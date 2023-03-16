require 'rails_helper'

RSpec.feature 'Food show page', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    sleep(1)
  end

  scenario 'Displays details and posts  for a single user' do
    sleep(1)
    expect(page).to have_content('Measurement unit')
  end

  scenario 'Clicking on New Food redirects to new page for food' do
    click_on 'New food'
    sleep(1)
    expect(current_path).to eq(new_food_path)
  end

  scenario 'Can add and delete food item' do
    food = Food.new(name: 'Apple Test', measurement_unit: 'grams', price: 10, quantity: 50, user_id: user.id)
    click_on 'New food'
    fill_in 'Name', with: food.name
    fill_in 'Price', with: food.price
    select('litres (L)', from: 'food_measurement_unit')
    fill_in 'Quantity', with: food.quantity
    click_on 'Create Food'
    expect(page).to have_css('tr', count: 2)
    sleep(1)
    click_on 'Delete'
    expect(page).to have_css('tr', count: 1)
  end
end

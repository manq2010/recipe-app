require 'rails_helper'

RSpec.feature 'Log in index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  before do
    visit new_user_session_path
  end

  scenario 'Displays login details' do
    expect(page).to have_content('Log in')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_css('button.btn', text: 'Log in')
    expect(page).to have_css('input#user_email', count: 1)
  end

  scenario 'Clicking on login with out filling in parameter returns error' do
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'Clicking on sign up redirects to user registration page' do
    click_link 'Sign up'
    sleep(1)
    expect(current_path).to eq(new_user_registration_path)
  end

  scenario 'User can login and sign out' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    sleep(1)
    expect(current_path).to eq(root_path)
    click_link 'Log out'
    sleep(1)
    expect(current_path).to eq(user_session_path)
  end
end

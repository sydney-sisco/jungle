require 'rails_helper'

RSpec.feature "User login", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Dude',
      last_name: 'McTester',
      email: 'dude@tester.com',
      password: '1234567890',
      password_confirmation: '1234567890'
    )
  end

  scenario "User can login" do
    # ACT
    visit root_path


    # first('article.product').find_button('Add').click()
    find_link('Login').click()
    expect(find('body > main > h1')).to have_content('Login')
    fill_in 'session_email', with: 'dude@tester.com'
    fill_in 'session_password', with: '1234567890'
    find_button('Login').click
    expect(page).to have_content('Logout')
  end
end
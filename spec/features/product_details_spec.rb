require 'rails_helper'

RSpec.feature "Visitor navigates to the product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see products details" do
    # ACT
    visit root_path
    first('article.product').find_link('Details').click()

    # DEBUG
    # save_screenshot

    # VERIFY
    expect(page).to have_css 'body > main > section > article > div > div.col-sm-4 > img', count: 1
  end
end
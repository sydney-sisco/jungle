require 'rails_helper'

RSpec.feature "Add to Cart", type: :feature, js: true do

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

  scenario "A user adds a product to cart" do
    visit root_path
    first('article.product').find_button('Add').click()
    find_link('My Cart (1)').click()
    expect(find('header.page-header')).to have_content('My Cart')
    expect(page).to have_content('64.99')
  end

end

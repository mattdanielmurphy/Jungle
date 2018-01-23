require 'rails_helper'

RSpec.feature 'ProductDetails', type: :feature do
  before :each do
    @category = Category.create! name: 'Apparel'

    # 10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    # end
  end

  scenario 'user can navigate from index to product
            detail page by clicking a product' do
    visit root_path

    first('.product > header > a').click

    expect(page).to have_css '.product-detail'
  end
end

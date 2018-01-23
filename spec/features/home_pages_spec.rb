require 'rails_helper'

RSpec.feature 'Visitor navigates to home page', type: :feature, js: true do
  scenario 'user sees all products' do
    visit root_path

    save_screenshot
    expect(page).to have_css 'article.product'
  end
end

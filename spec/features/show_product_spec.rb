require 'rails_helper'
RSpec.describe 'product details page' do
  it 'displays information about product' do
    product = Product.create(name:"Product1", description:"Product1 description", pricing: 100)
    visit "/products"
    click_link "Show"
    expect(current_path).to eq("/products/#{product.id}")
    expect(page).to have_text("Product1")
    expect(page).to have_text("Product1 description")
    expect(page).to have_text("Pricing")
  end
end
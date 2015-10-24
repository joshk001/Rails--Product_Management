require 'rails_helper'
RSpec.describe 'updating product' do
  it 'updates product and redirects to products page' do
	product = Product.create(name:"Product1", description:"Product1 description", pricing: 100)
	    visit "/products"
	    click_link "Edit"
	    fill_in "Name", with:"Product2"
	    click_button "Update"  
	    expect(current_path).to eq("/products")
	    expect(page).to have_text("Product2")
  end
end
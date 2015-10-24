require 'rails_helper'
RSpec.describe 'creating product' do
	before do 
		visit "/products/new"

  it 'creates a new product and redirect to products page' do
    fill_in "Name", with: "Product1"
    fill_in "Description", with: "Product1 description"
    fill_in "Price", with: "2.00"
    click_button "Create"
    expect(current_path).to eq("/products")
    expect(page).to have_text("Product1")
  end

  it 'returns to the product new page if does not pass validations' do 
  	click_button "Create"
  	expect(current_path).to eq("/products/new")
  	expect(page).to have_text("Name cannot be blank")
  	expect(page).to have_text("Description cannot be blank")
  	expect(page).to have_text("Pricing cannot be blank")

end
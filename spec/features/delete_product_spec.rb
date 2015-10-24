require 'rails_helper'
RSpec.describe 'deleting a product' do
  it 'deletes product and redirects to products page' do
    product = Product.create(name:"Product1", description:"Product1 description", pricing: 100)
	    visit "/products"
	    expect(page).to have_text("Product1")
	    click_link "Destroy"
	   	expect(page).to_not have_text("Product1")

  end
end
require 'rails_helper'
RSpec.describe 'product edit page' do
 	it 'displays form with current information of product prepopulated' do
		product = Product.create(name:"Product1", description:"Product1 description", pricing: 100)
	    visit "/products"
	    click_link "Edit"  
	    expect(current_path).to eq("/products/#{product.id}/edit")
	    expect(find_field("Name").value).to eq(product.name)
	    expect(find_field("Description").value).to eq(product.description)
	    expect(find_field("Pricing").value).to eq(product.pricing)

	end
end
class ProductsController < ApplicationController

	def index
		@products = Product.all
	end
	def new
		@categories = Category.all
	end
	def create
		category = Category.find(products_params[:category])
		p = Product.new(name: products_params[:name], description: products_params[:description], pricing: products_params[:pricing], category: category)
  		if p.save
			redirect_to '/products'
		else
			flash[:errors] = p.errors.full_messages
			redirect_to '/products/new'
		end
	end

	def show
		@product = Product.find(params[:id])
		@comments = @product.comments
	end

	def edit
		@product = Product.find(params[:id])
	end
	def update
		product = Product.find(params[:id])
		product.update(products_params)
		redirect_to '/products'
	end
	def destroy
		p = Product.find(params[:id])
		p.destroy
		redirect_to '/products'
	end

	def comment

	end

	private
	def products_params
		params.require(:product).permit(:name, :description, :category, :pricing)
	end

end

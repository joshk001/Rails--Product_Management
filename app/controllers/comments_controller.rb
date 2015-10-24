class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

	def create
		product = Product.find(params[:product_id])
		product.comments.create(comment: params[:comment][:comment])
		redirect_to "/products/#{product.id}"
		# redirect_to "/products/10"
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to "/products/#{params[:product_id]}"
	end
end
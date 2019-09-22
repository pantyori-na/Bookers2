class BooksController < ApplicationController
	def new
		@book = Book.new
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to root_path
	end
	def index
		@book = Book.new
		@books = Book.all
	end
	def show
		@book = Book.find(params[:id])
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to post_images_path
	end
	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
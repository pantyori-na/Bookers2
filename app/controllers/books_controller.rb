class BooksController < ApplicationController
	def index
		@book_new = Book.new
		@books = Book.all
	end
	def show
		@book_new = Book.new
		@book = Book.find(params[:id])
	end
	def edit
		@book = Book.find(params[:id])
	end
	def create
		@book = @book_new
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		if @book.save
			redirect_to books_path
		else
			@book_new = @book
			@books = Book.all
			render :index
		end
	end
	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to book_path(@book)
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end

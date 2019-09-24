class BooksController < ApplicationController
	def welcome
	end
	def aboute
	end
	def index
		@book_new = Book.new
		@books = Book.all
	end
	def show
		@book_new = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
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
			flash[:notice] = "You have creatad book successfully."
			redirect_to book_path(@book)
		else
			@book_new = @book
			@books = Book.all
			render :index
		end
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		if @book.update(book_params)
			flash[:notice] = "You have updated book successfully."
			redirect_to book_path(@book)
		else
			render :edit
		end
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

class UsersController < ApplicationController
	def show
		@book_new = Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end

	def index
		@book_new = Book.new
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		if @user.update(user_params)
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end

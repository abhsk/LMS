class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
	end

	def create
		book = Book.new(book_parameters)

		unless book.valid?
			flash[:error] = "Duplicate ISBN number"
			redirect_to books_path
			return
		end

		book.save
		flash[:notice] = "Book successfully created."
		redirect_to books_path
	end

	private 

	def book_parameters
		params.require(:book).permit(:title, :author, :isbn)
	end


end
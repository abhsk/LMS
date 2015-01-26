class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def create
		book = Book.new(book_parameters)

		unless book.valid?
			flash[:error] = "Duplicate ISBN number"
			redirect_to new_book_path
			return
		end

		book.save
		flash[:notice] = "Book successfully created."
		redirect_to new_book_path
	end

	private 

	def book_parameters
		params.require(:book).permit(:title, :author, :isbn)
	end


end
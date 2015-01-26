require 'spec_helper'

describe BooksController do

	it 'should assign new object to book' do
		get :new

		expect(assigns(:book).isbn).to be_nil
	end

	context 'create' do
		it 'should create a new book from the params' do
			book_parameters= {title: 'asd', author: 'asd', isbn: 'isbn'}
			
			post :create, book: book_parameters

			book = Book.first
			expect(Book.all.size).to eq(1)
			expect(book.title).to eq('asd')
			expect(book.author).to eq('asd')
			expect(book.isbn).to eq('isbn') 
			expect(flash[:notice]).to eq('Book successfully created.')

		end

		it 'should send already added for duplicate isbn number' do
			book_parameters= {title: 'asd', author: 'asd', isbn: 'isbn'}
			
			post :create, book: book_parameters

			post :create, book: book_parameters

			expect(Book.all.size).to eq(1)
			expect(flash[:error]).to eq('Duplicate ISBN number')
		end
	end

end
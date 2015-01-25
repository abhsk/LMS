require 'spec_helper'

describe BooksController do

	it 'should assign new object to book' do
		get :new

		expect(assigns(:book).isbn).to be_nil
	end

end
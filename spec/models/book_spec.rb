require 'spec_helper' 

describe Book  do
	
	it 'should validate all validations' do
		should validate_presence_of(:isbn)
		should validate_presence_of(:title)
		should validate_presence_of(:author)
	end

	it 'should validate uniqueness' do
		book = Book.create(title: 'Title', author: 'Author', isbn: 'A123')
		book1 = Book.new(title: 'Title1', author: 'Author1', isbn: 'A123')

		expect(book1).not_to be_valid
		expect(book1.errors.full_messages).to include("Isbn has already been taken")
	end



end
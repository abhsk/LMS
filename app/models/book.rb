class Book < ActiveRecord::Base

	validates :isbn, presence: true, uniqueness: true
	validates :title, presence: true
	validates :author, presence: true


end
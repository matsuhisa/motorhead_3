class BookAuthor < ActiveRecord::Base
  belongs_to :book
  belogns_to :author
end

class NewBooks::BooksController < ::BooksController
  include Motorhead::Controller

  def index
    @books = Book.limit(1)
  end

  def show
  end
end

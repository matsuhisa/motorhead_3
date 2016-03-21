class NewBooks::BooksController < ::BooksController
  include Motorhead::Controller

  def index
    super
    @authors = Author.all
  end

  def show
  end
end

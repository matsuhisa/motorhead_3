class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  permits :name, :price, :description

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create(book)
    @book = Book.new(book)

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PUT /books/1
  def update(book)
    if @book.update(book)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy

    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book(id)
      @book = Book.find(id)
    end
end

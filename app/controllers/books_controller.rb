class BooksController < ApplicationController
  def index
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
  end

  def edit
  end

  private
  def books_params
    params.require(:books).permit(:books_title, :books_body)
  end
end

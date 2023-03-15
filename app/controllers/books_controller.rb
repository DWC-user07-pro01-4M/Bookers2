class BooksController < ApplicationController
# books投稿一覧
  def index
    @books = Book.all
    @book = Book.new
  end
# books作成
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end
# books詳細
  def show
    @book = Book.find(params[:id])
    @book = Book.new
    @books = Book.all
  end
# books編集
  def edit
    @books = Book.find(params[:id])
  end
  # books更新
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end
  # books削除
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end

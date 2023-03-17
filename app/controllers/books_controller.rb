class BooksController < ApplicationController
before_action :authenticate_user!
# books投稿一覧
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
# books作成
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if@book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end
# books詳細
  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @books = Book.all
    @user = @book.user
  end
# books編集
  def edit
    is_matching_login_user
    @books = Book.find(params[:id])
  end
  # books更新
  def update
    is_matching_login_user
    @book = Book.find(params[:id])
    @book.update(book_params)
    if@book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @book = Book.find(params[:id])
      render :show
    end
  end
  # books削除
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end

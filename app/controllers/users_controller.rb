class UsersController < ApplicationController
before_action :authenticate_user!
  # users一覧
  def index
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)
  end
 # users詳細
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
 # users編集
  def edit
    is_matching_login_user
    @user = current_user
    @user = User.find(params[:id])
  end
 # users更新
  def update
    is_matching_login_user
    @user = current_user
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end

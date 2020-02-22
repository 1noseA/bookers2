class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def create
  @user = User.find(current_user.id)
  @books = Book.all
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
  else 
    render :index
  end
end

  private 
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

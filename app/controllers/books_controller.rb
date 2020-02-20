class BooksController < ApplicationController
def top
end

def about
end

def index
  @user = User.find(current_user.id)
	@books = Book.all
	@book = Book.new
end

def show
  @user = User.find(current_user.id)
	@book = Book.find(params[:id])
end

def edit
	@book = Book.find(params[:id])
end

def update
  book = Book.find(params[:id])
  if book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
  else
    render :index
  end
end

def create
	@book = Book.new(book_params)
  @book.user_id = current_user.id
	if @book.save
    flash[:notice] = "Book was successfully created."
  	redirect_to book_path(@book.id)
  else 
    render :index
  end
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
end

  private

  def book_params
	params.require(:book).permit(:title, :body)
  end
end


class BooksController < ApplicationController
def top
end

def about
end

def index
	@books = Book.all
	@book = Book.new
end

def show
	@book = Book.find(params[:id])
end

def edit
	@book = Book.find(params[:id])
end

def create
	@book = Book.new(params[:id])
	if @book.save
    flash[:notice] = "Book was successfully created."
  	redirect_to book_path(@book.id)
    else 
      @books = Book.all
      render 'index'
    end
  end

  private

  def book_params
	params.require(:book).permit(:title, :body)
  end
end


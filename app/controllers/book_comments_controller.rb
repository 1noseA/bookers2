class BookCommentsController < ApplicationController
  def create
	book = Book.find(params[:book_id])
    #@comment = current_user.book_comments.new(book_comment_params)
    @comment = BookComment.new(book_comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = book.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      @books = Book.all
      @book = Book.find(params[:book_id])
      @book_comment = BookComment.new
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  	book = Book.find(params[:book_id])
  	comment = current_user.book_comments.find_by(book_comment_params)
  	comment.destroy
  	redirect_back(fallback_location: root_path)
  end

  private
  def book_comment_params
  	params.require(:book_comment).permit(:comment)
  end
end

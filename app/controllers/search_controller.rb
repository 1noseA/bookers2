class SearchController < ApplicationController
  def search
    @books = Book.search(params[:search])
    @users = User.search(params[:search])
    @book = Book.new
    @user = current_user
  end
end

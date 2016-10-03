class BooksController < ApplicationController
  def index
    @books = Book.all

  end

  def new
    # your code here
  end

  def create
    Book.create(book_params)
    redirect_to "/books"
  end

  def destroy
    begin
      burned_book = Book.find(params[:id])
      burned_book.destroy if burned_book
    rescue ActiveRecord::RecordNotFound
      # Pass
    ensure
      params.delete(:id)
      redirect_to "/books"
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end

class BooksController < ApplicationController
  def index

  end
  # to create a new book
  def new
    # instance variable accessible in the view
    @authors = Author.all

    # instantiating a new object from book and assigning it to @book so allow the new book form to use it 
    # set the author ID that is set in the URL
    @book = Book.new(author_id: params[:author_id])

  end

  def create
    # Create an entry on book model
    # Book.create(title: something, url_image: something, author_id: something)
    # these values are passed in from params as params[:book][:title]

    # the equivalent
    # title = params[:book][:title]
    # url_image = params[:book][:url_image]
    # author_id = params[:book][:author_id]
    # Book.create(title: title, url_image: url_image, author_id: author_id)

    # params to expect a key of book which will include title, url_image, author_id
    # secure against sql injection
    # book_params = params.require(:book).permit(:title, :url_image, :author_id)
    Book.create(book_params)

    # Book.create(title: params[:book][:title], url_image: params[:book][:url_image], author_id: params[:book][:author_id])

    # after it is created, go back to the home page
    redirect_to authors_path # /authors
  end

  private

  def book_params
    params.require(:book).permit(:title, :url_image, :author_id)
  end
  
end
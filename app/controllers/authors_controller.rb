class AuthorsController < ApplicationController
  
  def index
    # search term is whatever that is inputted in the form
    @search_term = params[:search]

    if @search_term.blank?
      @authors = Author.all
    else
      @authors = Author.where("upper(name) LIKE ?", "%#{@search_term.upcase}%")
    end
  end
  
  def show
    @author = Author.find(params[:id])
  end
end

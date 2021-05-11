class SearchController < ApplicationController
  def search
    model = params[:model]
    key = params[:key]
    search = params[:search]

    if model == "Book"
      @results = Book.search(key, search)
    elsif model == "User"
      @results = User.search(key, search)
    end
  end
end

class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:sort] == "by_times_purchased"
      @books = Book.by_times_purchased.paginate(page: params[:page], per_page: 25)
    elsif params[:search]
      @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 25)
    else
      @books = Book.order(published_date: :desc).paginate(page: params[:page], per_page: 25)
    end
  end

end

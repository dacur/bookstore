class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all.paginate(:page => params[:page], :per_page => 25)
  end
end

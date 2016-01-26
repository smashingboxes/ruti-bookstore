class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @books = Book.all
  end

  private

  # strong params
  def user_params
    params.require(:book).permit(
      :title,
      :published_date,
      :author,
      :price,
      :category,
      :description
    )
  end
end
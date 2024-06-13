class PagesController < ApplicationController
  def top
    @books = Book.all
  end
end

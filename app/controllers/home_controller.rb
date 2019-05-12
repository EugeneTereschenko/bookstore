class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @books = Book.all
    @categories = Category.all
  end
  
end

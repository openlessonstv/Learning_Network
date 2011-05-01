class PagesController < ApplicationController
  def home
    @title = "Welcome to Open Learning!"
  end

  def about
    @title = "About Open Learning!"
  end

  def contact
  end

end

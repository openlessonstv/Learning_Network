class PagesController < ApplicationController
  def home
    @title = "Welcome to Open Lessons!"
  end

  def about
    @title = "About Open Lessons!"
  end

  def contact
  end

end

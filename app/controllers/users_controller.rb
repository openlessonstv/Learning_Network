class UsersController < ApplicationController
  def show
    @title = User.name
  end

  def about
    @title = "About Open Learning!"
  end

  def contact
  end

end

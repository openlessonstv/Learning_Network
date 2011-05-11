class UsersController < Clearance::UsersController
  def show
    @title = User.name
    @user = User.find(params[:id])
  end

  def about
    @title = "About Open Learning!"
  end

  def contact
  end

end

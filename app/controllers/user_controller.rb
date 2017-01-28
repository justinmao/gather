class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :salt))
    @user.save
    redirect_to root_path
  end

end

class UserController < ApplicationController

  def list
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:users).permit(
      :email,
      :password,
      :first_name,
      :last_name))
    @user.save
    redirect_to action: 'list'
  end

end

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success:'Registration has been completed'
    else
      flash.now[:danger] = "Signup failed"
      render :new
    end
  end

  def favorites
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

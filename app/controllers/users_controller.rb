class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Foodiez blog #{@user.username}, you have signup successfully"
      redirect_to articles_path
    else
      render 'new'
    end

  end
  private 
  def user_params
    params.require(:user).permit(:username, :email, :password_digest)
  end
end

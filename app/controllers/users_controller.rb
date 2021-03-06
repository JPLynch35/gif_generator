class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:success] = "Welcome #{@user.name}"
    else
      render :new
    end
  end

  def show
    @users = User.where.not(id: current_user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user && User.authenticate(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

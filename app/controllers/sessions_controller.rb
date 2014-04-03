class SessionsController < ApplicationController

  def new
    redirect_to root_path if current_user
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session[:id] = nil
    flash[:notice] = "You are logged out buddy."
    redirect_to root_path
  end

end

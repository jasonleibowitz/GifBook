class SessionController < ApplicationController


  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      sessions[:id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end

end

class UsersController < ApplicationController


  def index

  end

  def show

  end

  #form needed
  def new
    @user = User.new
  end

  #show page
  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def edit

  end

  def update

  end

  def delete

  end

  private
  def user_params
    params.require(:user).permit(:first_name,
                                  :last_name,
                                  :city,
                                  :state,
                                  :avatar_url,
                                  :email,
                                  :password,
                                  :password_confirmation)

  end
end

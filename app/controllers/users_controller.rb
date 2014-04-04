class UsersController < ApplicationController

  before_action :require_authentication, only: [:show, :edit, :update, :delete]

  def index

  end

  def show
    @user = User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: @user.id).order(created_at: :desc)
  end

  #form needed
  def new
    @user = User.new
    @current_user = current_user
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

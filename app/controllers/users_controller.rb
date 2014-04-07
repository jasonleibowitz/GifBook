class UsersController < ApplicationController

  before_action :require_authentication, only: [:show, :edit, :update, :delete]

  def index

  end

  def show
    @user = User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: @user.id).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def delete

  end

  private
  def user_params
    params.require(:user).permit(:first_name,
                                  :last_name,
                                  :email,
                                  :username,
                                  :password,
                                  :password_confirmation)

  end
end

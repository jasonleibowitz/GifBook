class WelcomeController < ApplicationController

  def index
    # @bookmarks = Bookmark.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @bookmarks = Bookmark.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    @current_user = current_user
  end

end

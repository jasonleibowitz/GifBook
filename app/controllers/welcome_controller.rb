class WelcomeController < ApplicationController

  def index
    @bookmarks = Bookmark.order(created_at: :desc)
    @current_user = current_user
  end

end

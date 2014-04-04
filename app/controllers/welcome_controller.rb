class WelcomeController < ActionController::Base

  def index
    @bookmarks = Bookmark.order(created_at: :desc)
  end

end

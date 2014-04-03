# bookmarks_controller.rb
class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(new_bookmark_params)
    @gif = Gif.create(gif_url: params[:gif_url])
    @bookmark.gif_id = @gif
    if @bookmark.valid?
      @bookmark.save
      redirect_to @bookmark
    else
      flash[:notice] = "#{@bookmark.errors}"
      render 'new'
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(update_bookmark_params)
      redirect_to @bookmark
    else
      render 'edit'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  private
    def new_bookmark_params
      return params.require(:bookmark).permit(:user_id, :title, :description)
    end

    def update_bookmark_params
      return params.require(:bookmark).permit(:title, :description)
    end

end

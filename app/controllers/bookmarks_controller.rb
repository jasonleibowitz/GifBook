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
    @bookmark.gif_id = @gif.id
    @tag = params[:tag].split(/ /)
    @tag.each do |tag|
      if !Tag.find_by(name: tag.downcase).nil?
        @bookmark.tags << Tag.create(name: tag.downcase)
      else
        @bookmark.tags << Tag.find_by(name: tag.downcase)
      end
    end
    if @bookmark.valid?
      @bookmark.save
      redirect_to user_path(current_user)
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
    if @bookmark.update(bookmark_params)
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
      return params.permit(:user_id, :title, :description)
    end

end
